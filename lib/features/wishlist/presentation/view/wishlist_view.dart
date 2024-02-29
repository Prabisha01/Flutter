import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlists_entity.dart';
import 'package:final_project/features/wishlist/presentation/view_model/get_wishlist_view_model.dart';
import 'package:final_project/features/wishlist/presentation/view_model/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistView extends ConsumerStatefulWidget {
  const WishlistView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishlistViewState();
}

class _WishlistViewState extends ConsumerState<WishlistView> {
  final ScrollController _scrollController = ScrollController();
  late List<WishlistsEntity> wishlistList;
  @override
  void initState() {
    ref.read(getWishlistViewModelProvider.notifier).getWishlist();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wishlistState = ref.watch(wishlistViewModelProvider);
    final wishlistsState = ref.watch(getWishlistViewModelProvider);
    wishlistList = wishlistsState.wishlists;
    print('wishlistState: ${wishlistsState.wishlists}');

    return Scaffold(
      appBar: AppBar(
        // Customize app bar color
        title: const Text(
          'Wishlist List',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  if (_scrollController.position.extentAfter == 0) {
                    ref
                        .read(getWishlistViewModelProvider.notifier)
                        .getWishlist();
                  }
                }
                return true;
              },
              child: RefreshIndicator(
                color: Colors.green, // Customize refresh indicator color
                backgroundColor: Colors.amberAccent,
                onRefresh: () async {
                  ref.read(wishlistViewModelProvider.notifier).resetMessage();
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: wishlistList.length ?? 0,
                  itemBuilder: (context, index) {
                    final wishlist = wishlistList[index];
                    final plantId = wishlist.plantId;
                    final wishlistId = wishlist.wishlistId;
                    final userId = wishlist.userId;
                    final addedAt = wishlist.addedAt;
                    final wishlistEntity = WishlistEntity(
                      wishlistId: wishlistId,
                      userId: userId,
                      plantId: plantId?['_id'] as String,
                      addedAt: addedAt,
                    );
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        leading: Image.network(
                          plantId?['plantImageUrl'] as String,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          wishlist.plantId?['plantName'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red, // Customize favorite icon color
                          ),
                          onPressed: () {
                            ref
                                .read(wishlistViewModelProvider.notifier)
                                .deleteWishlist(wishlistEntity);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (wishlistState.isLoading)
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
