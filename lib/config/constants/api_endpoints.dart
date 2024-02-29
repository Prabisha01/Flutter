class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  // static const String baseUrl = "http://10.0.2.2:5000/api/";
  // For MAC
  static const String baseUrl = "http://localhost:5500/api/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  static const String changePassword = "user/change_password/";
  static const String updateProfile = "user/update_user/";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "user/uploadImage";
  static const String forgetPassword = "user/forget_password";

  //================= Contact Route =====================
  static const String sendMessage = "contact/sendMessage";
  static const String getAllContacts = "contact/get_contact";

  //======================== blog Route =====================
  static const String getAllBlogs = "blog/get_blog";

  //======================== prodcuct Route =====================
  static const String getAllProducts = "product/get_products";

  //======================== Wishlist Route =====================
  static const String addToWishlist = "wishlist/addToWish";
  static const String getWishlist = "wishlist/get_wishlists/";
  static const String deleteWishlist = "wishlist/remove/";

  //======================== Cart Route =====================
  static const String addToCart = "addtocart/add_to_cart";
  static const String getCart = "addtocart/get_carts/";
  static const String removeFromCart = "addtocart/delete_cart/";

  static const String searchProduct = "product/search/:key";

  static const limitPage = 20;
}
