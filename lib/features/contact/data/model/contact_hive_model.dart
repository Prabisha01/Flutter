import 'package:equatable/equatable.dart';
import 'package:final_project/config/constants/hive_table_constant.dart';
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'contact_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.contactTableId)
class ContactHiveModel extends Equatable {
  @HiveField(0)
  final String contactId;

  @HiveField(1)
  final String contactName;

  @HiveField(2)
  final String contactEmail;

  @HiveField(3)
  final String contactMessage;

  ContactHiveModel({
    String? contactId,
    required this.contactName,
    required this.contactEmail,
    required this.contactMessage,
  }) : contactId = contactId ?? const Uuid().v4();

  ContactHiveModel.empty()
      : this(
            contactId: '',
            contactName: '',
            contactEmail: '',
            contactMessage: '');

  factory ContactHiveModel.toHiveModel(ContactEntity entity) =>
      ContactHiveModel(
        contactName: entity.contactName,
        contactEmail: entity.contactEmail,
        contactMessage: entity.contactMessage,
      );

  static ContactEntity toEntity(ContactHiveModel hiveModel) => ContactEntity(
      contactId: hiveModel.contactId,
      contactName: hiveModel.contactName,
      contactEmail: hiveModel.contactEmail,
      contactMessage: hiveModel.contactEmail);

  @override
  String toString() {
    return 'contactId: $contactId, contactName: $contactName, contactEmail: $contactEmail, contactMessage: $contactMessage';
  }

  @override
  List<Object?> get props => [
        contactId,
        contactName,
        contactEmail,
        contactMessage,
      ];
}
