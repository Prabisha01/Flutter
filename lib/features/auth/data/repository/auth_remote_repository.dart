import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:final_project/features/auth/domain/entity/auth_entity.dart';
import 'package:final_project/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  ),
);


class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override 
  Future<Either<Failure, String>> loginUser(String email, String password) async {
  final result= await _authRemoteDataSource.loginUser(email,password);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }

 
  
  @override
  Future<Either<Failure, String>> register(AuthEntity user, File image) async {
     final result= await _authRemoteDataSource.register(image, user);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }
  
  
  
  @override
  Future<Either<Failure, String>> changePassword(String password, String newPassword, String confirmPassword) async {
    final result= await _authRemoteDataSource.updateUserPassword(password,newPassword, confirmPassword);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }
  
  @override
  Future<Either<Failure, String>> changeProfile(String firstName, String lastName, String email, File image) async {
    final result= await _authRemoteDataSource.updateProfile(firstName,lastName,email, image);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }
  
  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, String>> forgetPassword(String email) async{
  final result= await _authRemoteDataSource.forgetPassword(email);
  return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  
  }
   
}