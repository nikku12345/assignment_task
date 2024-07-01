import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../routes/app_routes.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

   RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: authController.validateEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',

                ),
              ),
              TextField(
                onChanged: authController.validatePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',

                ),
              ),
              const SizedBox(height: 20),
              Obx(() => ElevatedButton(
                onPressed: authController.isFormValid.value ? authController.register : null,
                child: const Text('Register'),
              )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: authController.loginWithGoogle,
                child: const Text('Register with Google'),
              ),

              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.login),
                child: const Text('Already have an account? Login here.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
