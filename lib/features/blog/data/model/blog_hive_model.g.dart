// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogHiveModelAdapter extends TypeAdapter<BlogHiveModel> {
  @override
  final int typeId = 3;

  @override
  BlogHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogHiveModel(
      blogId: fields[0] as String?,
      blogTitle: fields[1] as String,
      blogAuthor: fields[2] as String,
      blogCategory: fields[4] as String,
      blogContent: fields[3] as String,
      blogDate: fields[5] as DateTime,
      blogImageUrl: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BlogHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.blogId)
      ..writeByte(1)
      ..write(obj.blogTitle)
      ..writeByte(2)
      ..write(obj.blogAuthor)
      ..writeByte(3)
      ..write(obj.blogContent)
      ..writeByte(4)
      ..write(obj.blogCategory)
      ..writeByte(5)
      ..write(obj.blogDate)
      ..writeByte(6)
      ..write(obj.blogImageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
