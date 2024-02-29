import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable{
  final String ? contactId;
  final String contactName;
  final String contactEmail;
  final String contactMessage;

  
  const ContactEntity ({
    this.contactId,
    required this.contactName,
    required this.contactEmail,
    required this.contactMessage,
  });


  @override 
  List<Object?> get props => [contactId , contactName, contactEmail, contactMessage];

}