// import 'package:collection/collection.dart';
// import 'package:dartz/dartz.dart';
// import 'package:final_project/features/auth/domain/use_case/login_usecase.dart';
// import 'package:final_project/features/auth/domain/use_case/register_usecase.dart';
// import 'package:final_project/features/auth/domain/use_case/upload_image.dart';
// import 'package:final_project/features/auth/presentation/auth_viewmodel/auth_viewmodel.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mockito/annotations.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import 'auth_unit_test.mocks.dart';

// // import 'auth_unit_test.mocks.dart';

// @GenerateNiceMocks([
//   MockSpec<RegisterUseCase>(),
//   MockSpec<LoginUseCase>(),
//   MockSpec<UploadImageUseCase>(),
//   MockSpec<BuildContext>(),



// ])
// void main(){
//   late RegisterUseCase mockRegisterUsecase;
//   late LoginUseCase mockloginUsecase;
//   late UploadImageUseCase uploadImageUseCase;
//   late BuildContext context;
//   late ProviderContainer container;

//   setUpAll((){
//     mockRegisterUsecase =MockRegisterUseCase();
//     mockloginUsecase =MockLoginUseCase();
//     uploadImageUseCase = MockUploadImageUseCase();
//     context = MockBuildContext();
//     container = ProviderContainer(
//       overrides: [
//         authViewModelProvider.overrideWith((ref) => AuthViewModel(
//           mockRegisterUsecase, mockloginUsecase,uploadImageUseCase
//           ))
//       ]
//     );

//     test('login test' , () async{
//        when(mockloginUsecase.loginUser('prabishakhadka2000@gmail.com', '12345'))
//        .thenAnswer((_) => Future.value(const Right((true))));

//     await container
//     .read(authViewModelProvider.notifier)
//     .loginUser(context, 'prabisha@1234', '1234');
//     });


//   });
  
// }