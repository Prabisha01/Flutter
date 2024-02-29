import 'package:equatable/equatable.dart';
import 'package:final_project/config/constants/hive_table_constant.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'nursy_hive_model.g.dart';

final nursyHiveModelProvider = Provider(
  (ref) => NursyHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.productTableId)
class NursyHiveModel extends Equatable {
  @HiveField(0)
  final String plantId;

  @HiveField(1)
  final String plantName;

  @HiveField(2)
  final int plantPrice;

  @HiveField(3)
  final String plantCategory;

  @HiveField(4)
  final String plantDescription;

  @HiveField(5)
  final String plantImageUrl;
  NursyHiveModel.empty()
      : this(
          plantId: Uuid().v4(),
          plantName: '',
          plantImageUrl: '',
          plantPrice: 0,
          plantCategory: '',
          plantDescription: '',
        );

  NursyHiveModel({
    required this.plantId,
    required this.plantName,
    required this.plantDescription,
    required this.plantImageUrl,
    required this.plantPrice,
    required this.plantCategory,
  });

  NursyHiveModel toHiveModel(NursyEntity entity) => NursyHiveModel(
        plantId: entity.plantId ?? const Uuid().v4(),
        plantName: entity.plantName,
        plantDescription: entity.plantDescription,
        plantImageUrl: entity.plantImageUrl,
        plantPrice: entity.plantPrice,
        plantCategory: entity.plantCategory,
      );

  NursyEntity toEntity() => NursyEntity(
        plantId: plantId,
        plantName: plantName,
        plantPrice: plantPrice,
        plantCategory: plantCategory,
        plantDescription: plantDescription,
        plantImageUrl: plantImageUrl,
      );

  List<NursyEntity> toEntityList(List<NursyHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        plantId,
        plantName,
        plantPrice,
        plantCategory,
        plantDescription,
        plantImageUrl
      ];

  @override
  String toString() {
    return 'plantId : $plantId, plantName: $plantName, plantPrice : $plantDescription, plantCategory : $plantCategory , plantImageUrl : $plantImageUrl';
  }
}
