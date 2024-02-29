
import 'package:final_project/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final String? password;

  AuthApiModel( {
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.password,
  });

 Map<String,dynamic> toJson(){
    return{
      'firstName': firstName,
      'lastName': lastName,
      'email':email,
      'password':password,
    };
  }
  

  factory AuthApiModel.fromJson(Map <String ,dynamic> json) {
    return AuthApiModel(
      userId: json['_id'],
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String);
  }
 


  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      userId: apiModel.userId,
      firstName: apiModel.firstName,
      lastName: apiModel.lastName,
      email: apiModel.email,
      password: apiModel.password,
    );
  }

  //From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      userId: entity.userId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
    );
  }
}
  
