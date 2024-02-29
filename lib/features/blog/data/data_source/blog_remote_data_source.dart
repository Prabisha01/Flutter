import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/config/constants/api_endpoints.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/remote/http_service.dart';
import 'package:final_project/core/shares_prefs/user_shared_prefs.dart';
import 'package:final_project/features/blog/data/dto/get_all_blog_dto.dart';
// import 'package:final_project/features/blog/data/model/blog_api_model.dart';
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogRemoteDataSourceProvider = Provider(
  (ref) => BlogRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),

  ),
   );

   class BlogRemoteDataSource {
    final Dio dio;
    final UserSharedPrefs userSharedPrefs;

    BlogRemoteDataSource({
      required this.dio,
      required this.userSharedPrefs,

    });
    
    Future<Either<Failure, List<BlogEntity>>> getAllBlogs() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllBlogs);
      if (response.statusCode == 200) {
        GetAllBlogDTO blogAddDTO = GetAllBlogDTO.fromJson(response.data);
       List<BlogEntity> blogList = blogAddDTO.blogs
       .map((blog) => blog.toEntity(blog))
       .toList();
       return Right(blogList);
        

      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }
}