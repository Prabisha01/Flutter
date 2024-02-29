import 'package:equatable/equatable.dart';

class NursyEntity extends Equatable {
  final String? plantId;
  final String plantName;
  final int plantPrice;
  final String plantCategory;
  final String plantDescription;
  final String plantImageUrl;

  @override
  List<Object?> get props => [
        plantId,
        plantName,
        plantCategory,
        plantPrice,
        plantDescription,
        plantImageUrl
      ];

  const NursyEntity(
      {this.plantId,
      required this.plantName,
      required this.plantPrice,
      required this.plantCategory,
      required this.plantDescription,
      required this.plantImageUrl});

  factory NursyEntity.fromJson(Map<String, dynamic> json) => NursyEntity(
      plantId: json['plantId'],
      plantName: json['plantName'],
      plantCategory: json['plantCategory'],
      plantPrice: json['plantPrice'],
      plantDescription: json['plantDescripion'],
      plantImageUrl: json['plantImageUrl']);

  @override
  String toString() {
    return 'NursyEntity(plantId: $plantId, plantName : $plantName, plantPrice : $plantPrice, plantCategory: $plantCategory, plantDescription: $plantDescription, plantImageUrl: $plantImageUrl)';
  }
}
