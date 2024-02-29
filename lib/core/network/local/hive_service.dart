// Create object using a provider
import 'package:final_project/config/constants/hive_table_constant.dart';
import 'package:final_project/features/blog/data/model/blog_hive_model.dart';
import 'package:final_project/features/auth/data/model/auth_hive_model.dart';
import 'package:final_project/features/contact/data/model/contact_hive_model.dart';
import 'package:final_project/features/product/data/model/nursy_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';

final hiveServiceProvider = Provider<HiveService>(
  (ref) => HiveService(),
);

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
    Hive.registerAdapter(ContactHiveModelAdapter());
    Hive.registerAdapter(BlogHiveModelAdapter());
    Hive.registerAdapter(NursyHiveModelAdapter());
    
  }

  // ======================== Auth Queries ========================

  Future<void> registerUser(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);
  }

  // Login
  Future<bool> loginUser(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var auths = box.values.toList();
    var auth = auths.firstWhere(
      (element) => element.email == email && element.password == password,
      orElse: () => AuthHiveModel.empty(),
    );

    if (auth == AuthHiveModel.empty()) {
      return false;
    } else {
      return true;
    }
  }

  // Delete hive
  Future<void> deleteHive() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
    await Hive.deleteBoxFromDisk(HiveTableConstant.contactBox);
  }

  // ======================== Contact Queries ========================
  Future<void> sendMessage(ContactHiveModel contact) async {
    var box =
        await Hive.openBox<ContactHiveModel>(HiveTableConstant.contactBox);
    await box.put(contact.contactId, contact);
  }

  // ======================== Blog ===================================

  Future<List<BlogHiveModel>> getAllBlogs() async {
    var box = await Hive.openBox<BlogHiveModel>(HiveTableConstant.blogBox);
    var blogs = box.values.toList();
    box.close();
    return blogs;
  }
  // ======================== Product ===================================

  Future<List<NursyHiveModel>> getAllProducts() async {
    var box = await Hive.openBox<NursyHiveModel>(HiveTableConstant.productBox);
    var products = box.values.toList();
    box.close();
    return products;
  }
  
 Future<List<NursyHiveModel>> searchProducts(String key) async {
    var box = await Hive.openBox<NursyHiveModel>(HiveTableConstant.productBox);
    var products = box.values.where((product) {
      // Implement your search logic here, for example, search by plantName
      return product.plantName.toLowerCase().contains(key.toLowerCase());
    }).toList();
    box.close();
    return products;
  }
}
