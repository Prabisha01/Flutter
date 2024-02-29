import 'package:final_project/core/shares_prefs/user_shared_prefs.dart';
import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:final_project/features/addtocart/presentation/view_model/cart_viewmodel.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:final_project/features/product/presentation/view_model/nursy_search_view_model.dart';
import 'package:final_project/features/product/presentation/view_model/nursy_view_model.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/presentation/view_model/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NursyView extends ConsumerStatefulWidget {
  const NursyView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NursyViewState();
}

class _NursyViewState extends ConsumerState<NursyView> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nursyState = ref.watch(nursyViewModelProvider);
    List<NursyEntity?>? products = nursyState.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                // You can perform real-time search as the user types
                // Implement logic to update the search results based on the value
                ref
                    .read(nursySearchViewModelProvider.notifier)
                    .searchProducts(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search products',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return buildProductCard(context, ref, products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(
      BuildContext context, WidgetRef ref, NursyEntity? product) {
    bool isFavorite = false;
    bool isInCart = false;

    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: Colors.black, width: 1.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: Container(
          width: 120,
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(180, 200, 157, 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product!.plantImageUrl,
              width: 100,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          product.plantName,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'Category: ${product.plantCategory}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 114, 114, 118),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Description: ${product.plantDescription}\nPrice: ${product.plantPrice}',
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                // ignore: dead_code
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () async {
                final data = await ref.read(userSharedPrefsProvider).getUser();
                String? id = data?['_id']?.toString() ?? '';

                final entity = WishlistEntity(
                  userId: id,
                  plantId: product.plantId!,
                  addedAt: DateTime.now(),
                );

                ref
                    .read(wishlistViewModelProvider.notifier)
                    .addToWishlist(entity, context);
              },
            ),
            IconButton(
                icon: Icon(
                  // ignore: dead_code
                  isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
                  color: isInCart ? Colors.blue : Colors.grey,
                ),
                onPressed: () async {
                  final data =
                      await ref.read(userSharedPrefsProvider).getUser();
                  String? id = data?['_id']?.toString() ?? '';
                  final entity = CartEntity(
                      userId: id,
                      plantId: product.plantId,
                      addedAt: DateTime.now(),
                      quantity: 1);
                  ref
                      .read(cartViewModelProvider.notifier)
                      .addToCart(entity, context);
                }),
          ],
        ),
      ),
    );
  }
}
