import 'package:final_project/features/addtocart/presentation/view/cart_view.dart';
import 'package:final_project/features/auth/presentation/view/forgot_view.dart';
import 'package:final_project/features/auth/presentation/view/update_profile.dart';
import 'package:final_project/features/auth/presentation/view/update_view.dart';
import 'package:final_project/features/blog/presentation/view/blog_view.dart';
import 'package:final_project/features/auth/presentation/view/login_view.dart';
import 'package:final_project/features/auth/presentation/view/signup_view.dart';
import 'package:final_project/features/contact/presentation/view/contact_view.dart';
import 'package:final_project/features/dashboard/presentation/view/home_view.dart';
import 'package:final_project/features/product/presentation/view/nursy_view.dart';
import 'package:final_project/features/product/presentation/view/product_view.dart';
import 'package:final_project/features/profile/presentation/view/profile_view.dart';

import 'package:final_project/features/splash/presentation/view/splash_view.dart';
import 'package:final_project/features/wishlist/presentation/view/wishlist_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/';
  static const String signupRoute = '/signup';
  static const String loginRoute = '/login';
  static const String dashboardRoute = '/dashboard';
  static const String contactRoute = '/contact';
  static const String blogRoute = '/blog';
  static const String profileRoute = '/profile';
  static const String productRoute = '/product';
  static const String wishlistRoute = '/wishlist';
  static const String cartRoute = '/cart';
  static const String updatePasswordRoute = '/updatePassword';
  static const String updateProfileRoute = '/updateProfile';
  static const String forgotRoute = '/forgetPassword';
  static const String detailRoute = '/productDetails';

  static getApplicationRoute() {
    return {
      dashboardRoute: (context) => const HomeView(),
      splashRoute: (context) => const SplashScreenView(),
      signupRoute: (context) => const SignUpView(),
      loginRoute: (context) => const LoginView(),
      contactRoute: (context) => const ContactView(),
      blogRoute: (context) => const BlogView(),
      profileRoute: (context) => const ProfileView(),
      productRoute: (context) => const NursyView(),
      wishlistRoute: (context) => const WishlistView(),
      cartRoute: (context) => const CartView(),
      updatePasswordRoute: (context) => const UpdateView(),
      updateProfileRoute: (context) => const UpdateProfile(),
      forgotRoute: (context) => const ForgotView(),
      detailRoute: (context) => const ProductDetailsView(),
    };
  }
}
