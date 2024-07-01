import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var isFormValid = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "346647903797-bcb4qop63mdfdj8n4cvbg4kc2ub2f2uj.apps.googleusercontent.com");


  void validateEmail(String input) {
    email.value = input;
    isEmailValid.value = GetUtils.isEmail(input);
    validateForm();
  }

  void validatePassword(String input) {
    password.value = input;
    isPasswordValid.value = input.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(input) &&
        RegExp(r'[a-z]').hasMatch(input) &&
        RegExp(r'[0-9]').hasMatch(input) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(input);
    validateForm();
  }

  void validateForm() {
    isFormValid.value = isEmailValid.value && isPasswordValid.value;
  }

  // lib/controllers/auth_controller.dart

  void register() async {
    if (isFormValid.value) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
        User? user = userCredential.user;

        if (user != null) {
          // Save user data to Firestore


          Get.snackbar("Success", "Registered successfully");

        }
      } catch (e) {
        Get.snackbar("Error", "Failed to register: $e");
      }
    }
  }

  void login() async {
    if (isFormValid.value) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
        User? user = userCredential.user;

        if (user != null) {
          Get.snackbar("Success", "Logged in successfully");

        }else{
          Get.snackbar("Failed", "Email or password not found");
        }
      } catch (e) {

        Get.snackbar("Error", "Failed to login: $e");
      }
    }
  }


  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {



        Get.snackbar("Success", "Registration Successfully Completed");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to login with Google: $e");
    }
  }


}
