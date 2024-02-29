import 'package:equatable/equatable.dart';

class WishlistEntity extends Equatable {
  final String? wishlistId;
  final String? userId;
  final String? plantId;
  final DateTime addedAt;

  const WishlistEntity({
    this.wishlistId,
    this.userId,
    this.plantId,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [wishlistId, userId, plantId, addedAt];

  factory WishlistEntity.fromJson(Map<String, dynamic> json) => WishlistEntity(
      wishlistId: json['wishlistId'],
      userId: json['userId'],
      plantId: json['plantId']['plantName'],
      addedAt: json['addedAt']);

  @override
  String toString() {
    return 'WishlistEntity( wislistId : $wishlistId , userId: $userId, plantId: $plantId , addedAt: $addedAt)';
  }

  WishlistEntity copyWith({
    String? plantId,
    DateTime? addedAt,
    String? userId, // Include userId in copyWith
  }) {
    return WishlistEntity(
      plantId: plantId ?? this.plantId,
      addedAt: addedAt ?? this.addedAt,
      userId: userId ?? this.userId,
    );
  }
}
