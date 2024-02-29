import 'package:final_project/features/product/data/model/nursy_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_nursy_dto.g.dart';

@JsonSerializable()
class GetAllNursyDTO {
  final bool success;
  final String message;
  final List<NursyAPIModel> products;

  GetAllNursyDTO({
    required this.success,
    required this.message,
    required this.products,
  });

  Map<String, dynamic> toJson() => _$GetAllNursyDTOToJson(this);

  factory GetAllNursyDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllNursyDTOFromJson(json);

  static GetAllNursyDTO toEntity(GetAllNursyDTO getAllNursyDTO) {
    return GetAllNursyDTO(
      success: getAllNursyDTO.success,
      message: getAllNursyDTO.message,
      products: getAllNursyDTO.products,
    );
  }

  static GetAllNursyDTO fromEntity(GetAllNursyDTO getAllNursyDTO) {
    return GetAllNursyDTO(
      success: getAllNursyDTO.success,
      message: getAllNursyDTO.message,
      products: getAllNursyDTO.products,
    );
}
}
