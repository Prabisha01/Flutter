

import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
 
  const AuthEntity({
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
 
  });

  @override
  List<Object?> get props =>
      [userId, firstName, lastName, email, password];
}
