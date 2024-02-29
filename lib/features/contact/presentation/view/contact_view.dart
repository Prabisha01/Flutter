import 'package:final_project/core/common/provider/is_network_provider.dart';
import 'package:final_project/core/common/snackbar/my_snackbar.dart';
import 'package:final_project/features/contact/domain/entity/contact_entity.dart';
import 'package:final_project/features/contact/presentation/viewmodel/contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactView extends ConsumerStatefulWidget {
  const ContactView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactView> {
  final _key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectivityStatusProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConnected == ConnectivityStatus.isDisconnected) {
        showSnackBar(
            message: 'No Internet Connection',
            context: context,
            color: Colors.red);
      } else if (isConnected == ConnectivityStatus.isConnected) {
        showSnackBar(message: 'You are online', context: context);
      }
      if (ref.watch(contactViewModelProvider).showMessage!) {
        showSnackBar(
            message: 'Message Sent Successfully',
            context: context,
            color: Colors.green);
        ref.read(contactViewModelProvider.notifier).resetMessage();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title:const Text('Contact Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key, // Wrap the Form widget with the key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Contact Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Contact Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: messageController,
                decoration: const InputDecoration(labelText: 'Contact Message'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle the form submission here
                  if (_key.currentState!.validate()) {
                    final entity = ContactEntity(
                      contactName: nameController.text.trim(),
                      contactEmail: emailController.text.trim(),
                      contactMessage: messageController.text.trim(),
                    );
                    // Register user
                    ref
                        .read(contactViewModelProvider.notifier)
                        .sendMessage(entity);
                  }
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
