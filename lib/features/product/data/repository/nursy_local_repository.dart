

import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/product/data/data_source/nursy_local_data_source.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:final_project/features/product/domain/repository/nursy_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nursyLocalRepositoryProvider = Provider<INursyRepository>((ref) {
  return NursyLocalRepositoryImpl(
    nursyLocalDataSource : ref.read(nursyLocalDataSourceProvider),
  );
});

class NursyLocalRepositoryImpl implements INursyRepository {
  final NursyLocalDataSource nursyLocalDataSource;

  NursyLocalRepositoryImpl({
    required this.nursyLocalDataSource,

  });

  
  @override
  Future<Either<Failure, List<NursyEntity>>> getAllProducts() {
    
     return nursyLocalDataSource.getAllProducts();
  }
  
  @override
  Future<Either<Failure, List<NursyEntity>>> searchProducts(String key) {
    return nursyLocalDataSource.searchProducts(key);
  }
  
  }