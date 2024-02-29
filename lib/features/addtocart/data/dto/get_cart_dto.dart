import 'package:final_project/features/addtocart/data/model/cart_api_model.dart';
import 'package:final_project/features/addtocart/data/model/cart_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_dto.g.dart';

@JsonSerializable()
class GetCartDTO {
  final bool success;
  final String message;
  @JsonKey(name: 'carts')
  final List<CartsAPIModel> carts;

  GetCartDTO({
    required this.success,
    required this.message,
    required this.carts,
  });

  factory GetCartDTO.fromJson(Map<String, dynamic> json) =>
      _$GetCartDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartDTOToJson(this);

  static GetCartDTO toEntity(GetCartDTO getAllNursyDTO) {
    return GetCartDTO(
      success: getAllNursyDTO.success,
      message: getAllNursyDTO.message,
      carts: getAllNursyDTO.carts,
    );
  }

  static GetCartDTO fromEntity(GetCartDTO getAllNursyDTO) {
    return GetCartDTO(
      success: getAllNursyDTO.success,
      message: getAllNursyDTO.message,
      carts: getAllNursyDTO.carts,
    );
  }
}
