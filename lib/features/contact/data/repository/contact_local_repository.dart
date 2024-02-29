import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
// import 'package:final_project/features/auth/data/repository/auth_local_repository.dart';
import 'package:final_project/features/contact/data/data_source/contact_local_data_source.dart';
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:final_project/features/contact/domain/repository/contact_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactLocalRepositoryProvider = Provider.autoDispose<IContactRepository>(
  (ref) =>ContactLocalRepository(ref.read(contactLocalDataSourceProvider)),


);

class ContactLocalRepository implements IContactRepository{

  final ContactLocalDataSource _contactLocalDataSource;

  ContactLocalRepository (this._contactLocalDataSource);
  @override
  Future<Either<Failure, bool>> sendMessage(ContactEntity user) {
        return _contactLocalDataSource.sendMessage(user);

  }
  
}