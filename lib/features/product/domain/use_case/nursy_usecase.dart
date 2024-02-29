import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';

import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:final_project/features/product/domain/repository/nursy_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nursyUsecaseProvider = Provider<NursyUseCase>(
  (ref) => NursyUseCase(
    nursyRepository: ref.watch(nursyRepositoryProvider),
  ),
);

class NursyUseCase {
  final INursyRepository nursyRepository;

  NursyUseCase({required this.nursyRepository});

  Future<Either<Failure, List<NursyEntity>>> getAllProducts() {
    return nursyRepository.getAllProducts();
  }
   Future<Either<Failure, List<NursyEntity>>> searchProducts(String key) {
    return nursyRepository.searchProducts(key);
  }
}