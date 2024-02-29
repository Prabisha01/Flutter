

import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:final_project/features/contact/domain/use_case/send_message_usecase.dart';
import 'package:final_project/features/contact/presentation/state/contact_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactViewModelProvider = StateNotifierProvider<ContactViewModel, ContactState>(
  (ref) => ContactViewModel(
    ref.read(sendMessageUseCaseProvider),
  
  ),
);

class ContactViewModel extends StateNotifier<ContactState> {
  final SendMessageUseCase _sendMessageUseCase;


  ContactViewModel(
    this._sendMessageUseCase,
   
  ) : super(ContactState.initial());

  
  Future<void> sendMessage(ContactEntity entity) async {
    state = state.copyWith(isLoading: true);
    final result = await _sendMessageUseCase.sendMessage(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );

    resetMessage();
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copyWith(
        showMessage: false, error: null, isLoading: false);
  }
}
