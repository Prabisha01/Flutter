// import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlists_entity.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'wishlist_api_model.g.dart';

@JsonSerializable()
class WishlistsAPIModel {
  @JsonKey(name: "_id")
  final String? wishlistId;
  final String? userId;
 Map<String, dynamic>? plantId;
  final String addedAt;

  WishlistsAPIModel(
      {this.wishlistId, this.userId, this.plantId, required this.addedAt});

  Map<String, dynamic> toJson() {
    return {
      'wishlistId': wishlistId,
      'userId': userId,
      'plantId': plantId,
      'addedAt': addedAt,
    };
  }

  factory WishlistsAPIModel.fromJson(Map<String, dynamic> json) {
    return WishlistsAPIModel(
      wishlistId: json['_id'],
      userId: json['userId'],
      plantId: json['plantId'],
      addedAt: json['addedAt'],
    );
  }
  // From entity to model
  factory WishlistsAPIModel.fromEntity(WishlistsEntity entity) {
    return WishlistsAPIModel(
      wishlistId: entity.wishlistId,
      userId: entity.userId,
      plantId: entity.plantId,
      addedAt: entity.addedAt.toIso8601String(),
    );
  }
  // From model to entity
  static WishlistsEntity toEntity(WishlistsAPIModel model) {
    return WishlistsEntity(
      plantId: model.plantId,
      wishlistId: model.wishlistId,
      userId: model.userId,
      addedAt: DateTime.parse(model.addedAt),
    );
  }
}
