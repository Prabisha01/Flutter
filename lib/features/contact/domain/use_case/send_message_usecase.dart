
import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:final_project/features/contact/domain/repository/contact_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final sendMessageUseCaseProvider = Provider.autoDispose<SendMessageUseCase>(
  (ref) => SendMessageUseCase(ref.read(contactRepositoryProvider))
);
class SendMessageUseCase{
  final IContactRepository _contactRepository;

  SendMessageUseCase( this._contactRepository);


  Future<Either<Failure, bool>> sendMessage(ContactEntity entity) async{
    return await _contactRepository.sendMessage(entity);
  }
}