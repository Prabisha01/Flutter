import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_api_model.g.dart';

@JsonSerializable()
class WishlistAPIModel {
  @JsonKey(name: "_id")
  final String? wishlistId;
  final String? userId;
  final String? plantId;
  final String addedAt;

  WishlistAPIModel(
      {this.wishlistId, this.userId, this.plantId, required this.addedAt});

  Map<String, dynamic> toJson() {
    return {
      'wishlistId': wishlistId,
      'userId': userId,
      'plantId': plantId,
      'addedAt': addedAt,
    };
  }

  factory WishlistAPIModel.fromJson(Map<String, dynamic> json) {
    return WishlistAPIModel(
      wishlistId: json['_id'],
      userId: json['userId'],
      plantId: json['plantId']['plantName'],
      addedAt: json['addedAt'],
    );
  }
  // From entity to model
  factory WishlistAPIModel.fromEntity(WishlistEntity entity) {
    return WishlistAPIModel(
      wishlistId: entity.wishlistId,
      userId: entity.userId,
      plantId: entity.plantId,
      addedAt: entity.addedAt.toIso8601String(),
    );
  }
  // From model to entity
  static WishlistEntity toEntity(WishlistAPIModel model) {
    return WishlistEntity(
      plantId: model.plantId,
      wishlistId: model.wishlistId,
      userId: model.userId,
      addedAt: DateTime.parse(model.addedAt),
    );
  }
}
