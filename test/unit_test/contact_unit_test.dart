// import 'package:final_project/features/contact/domain/use_case/send_message_usecase.dart';
// import 'package:final_project/features/contact/presentation/viewmodel/contact_view_model.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mockito/annotations.dart';
// //import flutter_test
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'contact_unit_test.mocks.dart';

// @GenerateNiceMocks([
//   MockSpec<SendMessageUseCase>(),
//   MockSpec<BuildContext>(),
// ])

// void main(){
//   late SendMessageUseCase mockSendMessageUseCase;
//   late BuildContext buildContext;
//    late ProviderContainer container;

//    setUpAll((){
//     mockSendMessageUseCase = MockSendMessageUseCase();
//     container = ProviderContainer(
//       overrides: [
//         contactViewModelProvider.overrideWith((ref) => ContactViewModel(
//           mockSendMessageUseCase
//         )
//         )

//       ]
//     );
//    });
//    test('set initial set', () async {
//     final viewModel = container.read(contactViewModelProvider);
//     expect(viewModel.isLoading, false);
//    });


//    test('contact test with name and password ', () async {
//     when(mockSendMessageUseCase.sendMessage('Prabisha' , 'Prabiha@gmail.com', "shaja"))
//     .thenAnswer((_)) => Future.value(const Right((true)));

//     await container 
//     .read()

//    })
//   }
  
