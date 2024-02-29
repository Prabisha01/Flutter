import 'package:equatable/equatable.dart';

class WishlistsEntity extends Equatable {
  final String? wishlistId;
  final String? userId;
  Map<String, dynamic>? plantId;
  final DateTime addedAt;

  WishlistsEntity({
    this.wishlistId,
    this.userId,
    this.plantId,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [wishlistId, userId, plantId, addedAt];

  factory WishlistsEntity.fromJson(Map<String, dynamic> json) => WishlistsEntity(
      wishlistId: json['wishlistId'],
      userId: json['userId'],
      plantId: json['plantId'],
      addedAt: json['addedAt']);

  @override
  String toString() {
    return 'WishlistEntity( wislistId : $wishlistId , userId: $userId, plantId: $plantId , addedAt: $addedAt)';
  }

  WishlistsEntity copyWith({
Map<String, dynamic>? plantId,
    DateTime? addedAt,
    String? userId, // Include userId in copyWith
  }) {
    return WishlistsEntity(
      plantId: plantId ?? this.plantId,
      addedAt: addedAt ?? this.addedAt,
      userId: userId ?? this.userId,
    );
  }
}
