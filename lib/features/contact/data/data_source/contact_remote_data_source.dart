
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/config/constants/api_endpoints.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/remote/http_service.dart';
import 'package:final_project/core/shares_prefs/user_shared_prefs.dart';
import 'package:final_project/features/contact/data/model/contact_api_model.dart';
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final contactRemoteDataSourceProvider = Provider<ContactRemoteDataSource>(
  (ref) => ContactRemoteDataSource(
    ref.read(httpServiceProvider),
    ref.read(userSharedPrefsProvider)
  ),
);

class ContactRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  ContactRemoteDataSource(this.dio,this.userSharedPrefs);

 

  Future<Either<Failure, bool>> sendMessage(ContactEntity user) async {
    try {
      ContactAPIModel apiModel = ContactAPIModel.fromEntity(user);
      Response response = await dio.post(
        ApiEndpoints.sendMessage,
        data: {
          "contactName": apiModel.contactName,
          "contactEmail": apiModel.contactEmail,
          "contactMessage": apiModel.contactMessage,
        
        },
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}

