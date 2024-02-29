import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:final_project/features/auth/presentation/auth_viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_routes.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  late StreamSubscription<ProximityEvent> _proximityEvent;

  @override
  void initState() {
    super.initState();
    _proximityEvent = proximityEvents!.listen((ProximityEvent event) async {
      if (event.proximity < 2) {
        ref.read(authViewModelProvider.notifier).logout(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.blogRoute);
              },
              icon: const Icon(
                Icons.article,
                color: Colors.black,
              ),
              label: const Text(
                'Blog',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(243, 247, 244, 1),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.contactRoute);
              },
              icon: const Icon(
                Icons.message,
                color: Colors.black,
              ),
              label: const Text(
                'Message',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(243, 247, 244, 1),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, AppRoute.updatePasswordRoute);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
              label: const Text(
                'Update Password',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(
                    243, 247, 244, 1), // Adjust color as needed
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.updateProfileRoute);
              },
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: const Text(
                'Update Profile',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(
                    243, 247, 244, 1), // Adjust color as needed
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(authViewModelProvider.notifier).logout(context);
              },
              label: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(243, 247, 244, 1),
              ),
            ),
            const SizedBox(height: 320),
            const Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8),
                Center(
                  child: Center(
                    child: Text(
                      '9800000000',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '|',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 8),
                Center(
                  child: Text(
                    'Duwakot',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
