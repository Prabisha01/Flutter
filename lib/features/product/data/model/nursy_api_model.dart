import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nursy_api_model.g.dart';

@JsonSerializable()
class NursyAPIModel {
  @JsonKey(name: '_id')
  final String? plantId;
  final String plantName;
  final int plantPrice;
  final String plantDescription;
  final String plantCategory;
  final String plantImageUrl;

  NursyAPIModel(
      {this.plantId,
      required this.plantName,
      required this.plantPrice,
      required this.plantDescription,
      required this.plantCategory,
      required this.plantImageUrl});

  factory NursyAPIModel.fromJson(Map<String, dynamic> json) {
    return NursyAPIModel(
      plantId: json['_id'],
      plantName: json['plantName'],
      plantPrice: json['plantPrice'],
      plantCategory: json['plantCategory'],
      plantDescription: json['plantDescription'],
      plantImageUrl: json['plantImageUrl'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'plantName': plantName,
      'plantPrice': plantPrice,
      'plantCategory': plantCategory,
      'plantDescription': plantDescription,
      'plantImageUrl': plantImageUrl,
    };
  }

  NursyEntity toEntity(NursyAPIModel model) => NursyEntity(
        plantId: model.plantId,
        plantName: model.plantName,
        plantPrice: model.plantPrice,
        plantDescription: model.plantDescription,
        plantCategory: model.plantCategory,
        plantImageUrl: model.plantImageUrl,
      );

  NursyEntity toAnEntity() => NursyEntity(
        plantId: plantId,
        plantName: plantName,
        plantPrice: plantPrice,
        plantDescription: plantDescription,
        plantCategory: plantCategory,
        plantImageUrl: plantImageUrl,
      );
  NursyAPIModel fromEntity(NursyEntity entity) => NursyAPIModel(
        plantName: entity.plantName,
        plantPrice: entity.plantPrice,
        plantDescription: entity.plantDescription,
        plantCategory: entity.plantCategory,
        plantImageUrl: entity.plantImageUrl,
      );

  List<NursyEntity> toEntityList(List<NursyAPIModel> models) =>
      models.map((model) => model.toAnEntity()).toList();
}
