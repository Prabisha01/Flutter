
import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/product/data/data_source/nursy_remote_datasource.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:final_project/features/product/domain/repository/nursy_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nursyRemoteRepositoryProvider = Provider<INursyRepository>(
  (ref) => NursyRemoteRepositoryImpl(
    nursyRemoteDataSource: ref.read(nursyRemoteDataSourceProvider),
  ),
);

class NursyRemoteRepositoryImpl implements INursyRepository {
  final NursyRemoteDataSource nursyRemoteDataSource;

  NursyRemoteRepositoryImpl({required this.nursyRemoteDataSource});

  

  @override
  Future<Either<Failure, List<NursyEntity>>> getAllProducts() {
     return nursyRemoteDataSource.getAllProducts();
  }
  @override
  Future<Either<Failure, List<NursyEntity>>> searchProducts(String key) {
    return nursyRemoteDataSource.searchProducts(key);
  }
}
