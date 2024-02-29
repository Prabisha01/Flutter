import 'package:final_project/features/blog/data/model/blog_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_blog_dto.g.dart';

@JsonSerializable()
class GetAllBlogDTO {
  final bool success;
  final String message;
  final List<BlogApiModel> blogs;

  GetAllBlogDTO({
    required this.success,
    required this.message,
    required this.blogs,
  });

  Map<String, dynamic> toJson() => _$GetAllBlogDTOToJson(this);

  factory GetAllBlogDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllBlogDTOFromJson(json);

  static GetAllBlogDTO toEntity(GetAllBlogDTO getAllBlogDTO) {
    return GetAllBlogDTO(
      success: getAllBlogDTO.success,
      message: getAllBlogDTO.message,
      blogs: getAllBlogDTO.blogs,
    );
  }

  static GetAllBlogDTO fromEntity(GetAllBlogDTO getAllBlogDTO) {
    return GetAllBlogDTO(
      success: getAllBlogDTO.success,
      message: getAllBlogDTO.message,
      blogs: getAllBlogDTO.blogs,
    );
}
}
