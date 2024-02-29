import 'package:final_project/core/common/provider/is_dark_theme.dart';
import 'package:final_project/features/addtocart/domain/entity/carts_entity.dart';
import 'package:final_project/features/addtocart/presentation/view_model/get_viewmodel.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:final_project/features/product/presentation/view_model/nursy_view_model.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlists_entity.dart';
import 'package:final_project/features/wishlist/presentation/view_model/get_wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  late bool isDark;

  String truncateDescription(String description) {
    List<String> words = description.split(' ');
    String truncatedDescription = words.take(10).join(' ');
    if (words.length > 15) {
      truncatedDescription += '...';
    }
    return truncatedDescription;
  }

  @override
  void initState() {
    isDark = ref.read(isDarkThemeProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nursyState = ref.watch(nursyViewModelProvider);
    ref.read(getCartViewModelProvider);
    ref.read(getWishlistViewModelProvider);
    List<NursyEntity?>? products = nursyState.products;
    List<CartsEntity> carts = ref.watch(getCartViewModelProvider).carts;
    List<WishlistsEntity?> wishlist =
        ref.watch(getWishlistViewModelProvider).wishlists;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: const [
          // Switch(
          //   value: isDark,
          //   onChanged: (value) {
          //     setState(() {
          //       isDark = value;
          //       ref.read(isDarkThemeProvider.notifier).updateTheme(value);
          //     });
          //   },
          // ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length ?? 0,
        itemBuilder: (context, index) {
          NursyEntity? product = products[index];
          String truncatedDescription =
              truncateDescription(product?.plantDescription ?? '');

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/productDetails", arguments: [
                products[index]?.plantId as String,
                products[index]?.plantName as String,
                products[index]?.plantPrice.toString() as String,
                products[index]?.plantDescription as String,
                products[index]?.plantCategory as String,
                products[index]?.plantImageUrl as String,
              ]);
            },
            child: Card(
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
                      product?.plantImageUrl ?? '',
                      width: 100,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  product?.plantName ?? '',
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
                        'Category: ${product?.plantCategory ?? ''}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 114, 114, 118),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Description: $truncatedDescription\nPrice: ${product?.plantPrice ?? ''}',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
