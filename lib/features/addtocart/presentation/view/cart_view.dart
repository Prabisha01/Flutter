import 'package:final_project/features/addtocart/presentation/view_model/cart_viewmodel.dart';
import 'package:final_project/features/addtocart/presentation/view_model/get_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(getCartViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        // Customize app bar color
        title: const Text(
          'Cart List',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  if (_scrollController.position.extentAfter == 0) {
                    ref.read(getCartViewModelProvider.notifier).getCart();
                  }
                }
                return true;
              },
              child: RefreshIndicator(
                color: Colors.green, // Customize refresh indicator color
                backgroundColor: Colors.amberAccent,
                onRefresh: () async {
                  ref.read(cartViewModelProvider.notifier).resetMessage();
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: cartState.carts.length,
                  itemBuilder: (context, index) {
                    final cart = cartState.carts[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        title: Text(
                          cart.plantId!,
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
                                .read(getCartViewModelProvider.notifier)
                                .removeFromCart(cart);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (cartState.isLoading)
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
