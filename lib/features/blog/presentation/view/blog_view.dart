import 'package:all_sensors2/all_sensors2.dart';
import 'package:final_project/features/auth/presentation/auth_viewmodel/auth_viewmodel.dart';
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:final_project/features/blog/presentation/view_model/blog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogView extends ConsumerStatefulWidget {
  const BlogView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BlogViewState();
}

class _BlogViewState extends ConsumerState<BlogView> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  DateTime _lastShakeTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _lastShakeTime= DateTime.now() ;
    _initializeAccelerometer();
  }

  @override
  Widget build(BuildContext context) {
    final blogState = ref.watch(blogViewModelProvider);
    List<BlogEntity?>? blogs = blogState.blogs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Colors.black, width: 1.0),
            ),
            child: ListTile(
              leading: Image.network(
                blogs[index]!.blogImageUrl,
                width: 100,
                height: 250,
                fit: BoxFit.cover,
              ),
              title: Text(
                blogs[index]!.blogTitle,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Blog Category with different styling
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Category: ${blogs[index]!.blogCategory}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 23, 141, 23),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Date: ${blogs[index]!.blogDate}\nAuthor: ${blogs[index]!.blogAuthor}\nDescription: ${blogs[index]!.blogContent}',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _initializeAccelerometer() {
    accelerometerEvents?.listen((AccelerometerEvent event) {
      final double totalAcceleration =
          event.x.abs() + event.y.abs() + event.z.abs();
      if (totalAcceleration > 20) {
        final DateTime now = DateTime.now();
        if (now.difference(_lastShakeTime) > const Duration(seconds: 1)) {
          _lastShakeTime = now;
        }
        ref.read(authViewModelProvider.notifier).logout(context);
      }
    });
  }
}
