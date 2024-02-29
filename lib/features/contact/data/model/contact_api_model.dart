
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_api_model.g.dart';

@JsonSerializable()
class  ContactAPIModel{
  @JsonKey(name : "_id")
  final String? contactId;
  final String contactName;
  final String contactEmail;
  final String contactMessage;

  ContactAPIModel({this.contactId, required this.contactName, required this.contactEmail, required this.contactMessage});
   
   
   factory ContactAPIModel.fromJson(Map<String, dynamic> json) =>
      _$ContactAPIModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactAPIModelToJson(this);


  factory ContactAPIModel.toEntity(ContactAPIModel apiModel){
    return ContactAPIModel(
      contactId: apiModel.contactId,
      contactName: apiModel.contactName,
      contactEmail: apiModel.contactEmail,
      contactMessage: apiModel.contactMessage,
    );
  }

  factory ContactAPIModel.fromEntity(ContactEntity entity){
    return ContactAPIModel(
      contactId: entity.contactId,
      contactName: entity.contactName,
       contactEmail: entity.contactEmail, 
       contactMessage: entity.contactMessage,
       );
  }
  

}