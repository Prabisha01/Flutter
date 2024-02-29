import 'package:final_project/core/common/provider/is_network_provider.dart';
import 'package:final_project/core/common/snackbar/my_snackbar.dart';
import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:final_project/features/addtocart/presentation/view_model/cart_viewmodel.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:final_project/features/product/presentation/view_model/nursy_view_model.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/presentation/view_model/wishlist_view_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shares_prefs/user_shared_prefs.dart';

class ProductDetailsView extends ConsumerStatefulWidget {
  const ProductDetailsView({super.key});

  @override
  ConsumerState<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends ConsumerState<ProductDetailsView> {
  bool isFavorite = false;
  bool isInCart = false;
  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectivityStatusProvider);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (isConnected == ConnectivityStatus.isDisconnected) {
    //     showSnackBar(
    //         message: 'No Internet Connection',
    //         context: context,
    //         color: Colors.red);
    //   } else if (isConnected == ConnectivityStatus.isConnected) {
    //     showSnackBar(message: 'You are online', context: context);
    //   }

    //   if (ref.watch(favoriteViewModelProvider).showMessage!) {
    //     showSnackBar(
    //         message: 'Favorite created Successfully', context: context);
    //     // ref.read(favoriteViewModelProvider.notifier).resetMessage();
    //   }
    // });
// for cart
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConnected == ConnectivityStatus.isDisconnected) {
        showSnackBar(
            message: 'No Internet Connection',
            context: context,
            color: Colors.red);
      } else if (isConnected == ConnectivityStatus.isConnected) {
        showSnackBar(message: 'You are online', context: context);
      }

      if (ref.watch(cartViewModelProvider).showMessage!) {
        showSnackBar(
            message: 'Added to My Cart Successfully', context: context);
        // ref.read(myCartViewModelProvider.notifier).resetMessage();
      }
    });

     final nursyState = ref.watch(nursyViewModelProvider);
    List<NursyEntity?>? products = nursyState.products;
    final args = ModalRoute.of(context)!.settings.arguments as List<String?>;
    final plantId = args[0] ?? 'plantId';
    final plantName = args[1] ?? 'plantName';
    final plantPrice = args[2] ?? 'plantPrice';
    final plantDescription = args[3] ?? 'plantDescription';
    final plantCategory = args[4] ?? 'plantCategory';
    final plantImageURL = args[5];
    'productImageUrl';

    final favoriteState = ref.watch(wishlistViewModelProvider);
    final myCartState = ref.watch(cartViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(plantImageURL!),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Product Details
            Text(
              plantName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'NPR.${plantPrice}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              plantCategory,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              plantDescription,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            // Price

            // Buttons - Favorite and Add to Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Favorite Button
                
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
                  // plantId: products.,
                  addedAt: DateTime.now(),
                );

                ref
                    .read(wishlistViewModelProvider.notifier)
                    .addToWishlist(entity, context);
              },
            ),
            ],// {
                  //   // Toggle the favorite status or handle the favorite action
                  //   setState(() {
                  //     isFavorite = !isFavorite;
                  //   }

                  //   );
                  // },
                ),
                Text(
                  isFavorite ? 'Remove from Favorite' : 'Add to Favorite',
                  style: TextStyle(fontSize: 12),
                ),
                // Add to Cart Button
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
                      // plantId: products.plantId,
                      addedAt: DateTime.now(),
                      quantity: 1);
                  ref
                      .read(cartViewModelProvider.notifier)
                      .addToCart(entity, context);
                }),
                  // {
                  //   // Toggle the cart status or handle the cart action

                  //   setState(() {
                  //     isInCart = !isInCart;
                  //   });
                  // },
          ],
                ),
               
            ),

            
         
        );
    
  }
}
