import 'package:final_project/features/addtocart/presentation/view/cart_view.dart';
import 'package:final_project/features/blog/presentation/view/blog_view.dart';
import 'package:final_project/features/dashboard/presentation/view/bottom/dashboard_view.dart';
import 'package:final_project/features/product/presentation/view/nursy_view.dart';
import 'package:final_project/features/profile/presentation/view/profile_view.dart';
import 'package:final_project/features/wishlist/presentation/view/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int selectedIndex = 0;
  bool isDarkMode = false;

  List<Widget> lstScreen = [
    const DashboardView(),
    const NursyView(),
    const WishlistView(),
    const CartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true, // Set the background color here
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          // ref.read(homeViewModelProvider.notifier).changeIndex(index);
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: isDarkMode
            ? Color.fromARGB(255, 53, 51, 51)
            : Color.fromARGB(255, 47, 52, 47),
        unselectedItemColor:
            isDarkMode ? Colors.white : Color.fromARGB(255, 164, 163, 163),
        backgroundColor: isDarkMode
            ? Colors.black
            : const Color.fromARGB(255, 106, 129, 148),
      ),
    );
  }
}
