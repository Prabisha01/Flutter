

import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/local/hive_service.dart';
import 'package:final_project/features/product/data/model/nursy_hive_model.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nursyLocalDataSourceProvider = Provider<NursyLocalDataSource>((ref){
  return NursyLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    nursyHiveModel : ref.read(nursyHiveModelProvider));

});
class NursyLocalDataSource{
  final HiveService hiveService;
  final NursyHiveModel nursyHiveModel;

  NursyLocalDataSource({
    required this.hiveService,
    required this.nursyHiveModel
  });

  Future<Either<Failure, List <NursyEntity>>> getAllProducts() async {
    try {
      final products = await hiveService.getAllProducts();
      final productEntities = nursyHiveModel.toEntityList(products);
      return Right(productEntities);


    }catch (e){
      return Left(Failure(error: e.toString()));
    }
  }
  Future<Either<Failure, List<NursyEntity>>> searchProducts(String key) async {
    try {
      // Implement your local search logic here using Hive or any other local storage mechanism
      // Example: Fetch products that match the search key
      final searchResults = await hiveService.searchProducts(key);
      
      // Convert the results to a list of NursyEntity
      final productEntities = nursyHiveModel.toEntityList(searchResults);

      return Right(productEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

}
