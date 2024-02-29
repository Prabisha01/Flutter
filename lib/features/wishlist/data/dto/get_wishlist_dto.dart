import 'package:final_project/features/wishlist/data/model/wishlist_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_wishlist_dto.g.dart';


@JsonSerializable()
class GetWishlistDTO {
  final bool success;
  final String message;
  @JsonKey(name: 'wishlists')
  final List<WishlistAPIModel> wishlists;
 
  GetWishlistDTO({
    required this.success,
    required this.message,
    required this.wishlists,
  });
 
  factory GetWishlistDTO.fromJson(Map<String, dynamic> json) =>
      _$GetWishlistDTOFromJson(json);
 
  Map<String, dynamic> toJson() => _$GetWishlistDTOToJson(this);
 
  static GetWishlistDTO toEntity(GetWishlistDTO getAllNursyDTO) {
    return GetWishlistDTO(
      success: getAllNursyDTO.success,
      message: getAllNursyDTO.message,
      wishlists: getAllNursyDTO.wishlists,
    );
  }
 
  static GetWishlistDTO fromEntity(GetWishlistDTO getAllNursyDTO) {
    return GetWishlistDTO(
      success: getAllNursyDTO.success,
      message: getAllNursyDTO.message,
      wishlists: getAllNursyDTO.wishlists,
    );
  }
}