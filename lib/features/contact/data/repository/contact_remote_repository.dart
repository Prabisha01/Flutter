
import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/contact/data/data_source/contact_remote_data_source.dart';
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:final_project/features/contact/domain/repository/contact_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactRemoteRepositoryProvider = Provider<IContactRepository>
(
  (ref) =>ContactRemoteRepository(
    ref.read(contactRemoteDataSourceProvider)

  ),
);

class ContactRemoteRepository implements IContactRepository{
  final ContactRemoteDataSource _contactRemoteDataSource;

  ContactRemoteRepository(this._contactRemoteDataSource);

  @override
  Future<Either<Failure, bool>> sendMessage(ContactEntity user)  async{
    return await _contactRemoteDataSource.sendMessage(user);

  }
}