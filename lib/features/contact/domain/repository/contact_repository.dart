import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/contact/data/repository/contact_remote_repository.dart';
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final contactRepositoryProvider = Provider<IContactRepository>(
  (ref) => ref.read(contactRemoteRepositoryProvider),
);


abstract class IContactRepository{
   Future<Either<Failure, bool>> sendMessage(ContactEntity user);
  
}