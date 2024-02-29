import 'package:dartz/dartz.dart';
import 'package:final_project/core/common/provider/is_network_provider.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/blog/data/repository/blog_local_repository.dart';
import 'package:final_project/features/blog/data/repository/blog_remote_repository.dart';
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogRepositoryProvider = Provider<IBlogRepository>(
  (ref) {
    // return ref.watch(batchLocalRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    if (ConnectivityStatus.isConnected == internetStatus) {
      // If internet is available then return remote repo
      return ref.watch(blogRemoteRepositoryProvider as AlwaysAliveProviderListenable<IBlogRepository>);
    } else {
      // If internet is not available then return local repo
      return ref.watch(blogLocalRepositoryProvider as AlwaysAliveProviderListenable<IBlogRepository>);
    }
  },
);

abstract class IBlogRepository {
  Future<Either<Failure, List<BlogEntity>>> getAllBlogs();
}