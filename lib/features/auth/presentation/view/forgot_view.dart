
import 'package:final_project/features/auth/presentation/auth_viewmodel/auth_viewmodel.dart';
import 'package:final_project/features/auth/presentation/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotView extends ConsumerStatefulWidget {
  const ForgotView({super.key});

  @override
  ConsumerState<ForgotView> createState() => _forgotViewState();
}

class _forgotViewState extends ConsumerState<ForgotView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             
              const SizedBox(height: 20),
              TextFormField(
                key: const ValueKey('email'),
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
             
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Validation successful, proceed with navigation
                    await ref.read(authViewModelProvider.notifier).forgetPassword(
                          context,
                          _emailController.text,
                        
                        );
                  }
                },
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const DashboardView()),
                //   );
                // },
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
                
              ),
               
            ],
          ),
        ),
      ),
    );
  }
}
