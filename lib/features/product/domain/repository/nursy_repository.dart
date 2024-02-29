import 'package:dartz/dartz.dart';
import 'package:final_project/core/common/provider/is_network_provider.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/product/data/repository/nursy_local_repository.dart';
import 'package:final_project/features/product/data/repository/nursy_remote_repository.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nursyRepositoryProvider = Provider<INursyRepository>(
  (ref) {
   
    final internetStatus = ref.watch(connectivityStatusProvider);

    if (ConnectivityStatus.isConnected == internetStatus) {
      // If internet is available then return remote repo
      return ref.watch(nursyRemoteRepositoryProvider);
    } else {
      // If internet is not available then return local repo
      return ref.watch(nursyLocalRepositoryProvider);
    }
  }
);

abstract class INursyRepository {
  Future<Either<Failure, List<NursyEntity>>> getAllProducts();
    Future<Either<Failure, List<NursyEntity>>> searchProducts(String key);
}