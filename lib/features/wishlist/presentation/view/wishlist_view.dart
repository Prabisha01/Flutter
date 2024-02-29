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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wishlistState = ref.watch(getWishlistViewModelProvider);

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
                  itemCount: wishlistState.wishlists.length,
                  itemBuilder: (context, index) {
                    final wishlist = wishlistState.wishlists[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        title: Text(
                          wishlist.plantId!,
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
                                .read(getWishlistViewModelProvider.notifier)
                                .deleteWishlist(wishlist);
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
