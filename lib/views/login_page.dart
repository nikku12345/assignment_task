import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
                  //errorText: authController.isPasswordValid.value ? null : 'Invalid password',
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => ElevatedButton(
                onPressed: authController.isFormValid.value ? authController.login : null,
                child: const Text('Login'),
              )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: authController.loginWithGoogle,
                child: const Text('Login with Google'),
              ),

              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.register),
                child: const Text('Don\'t have an account? Register here.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
