
import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/local/hive_service.dart';
import 'package:final_project/features/contact/data/model/contact_hive_model.dart';
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactLocalDataSourceProvider = Provider<ContactLocalDataSource>(
  (ref) => ContactLocalDataSource(ref.watch(hiveServiceProvider)),
);

class ContactLocalDataSource {
  final HiveService _hiveService;

  ContactLocalDataSource(this._hiveService);

  Future<Either<Failure, bool>> sendMessage(ContactEntity entity) async {
    try {
      // Convert auth entity to auth hive model
      ContactHiveModel contactHiveModel = ContactHiveModel.toHiveModel(entity);
      // Save auth hive model to hive
      await _hiveService.sendMessage(contactHiveModel);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}


