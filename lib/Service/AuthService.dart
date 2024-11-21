import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authservice extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // Get the current user
  User? get currentUser => _auth.currentUser;

  // Register a new user
  Future<void> registerWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential=  userCredential;
      Get.snackbar("Success", "User registered successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to register: ${e.toString()}");
    }
  }

  // Login with email and password
  Future<void> loginWithEmailPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "User logged in successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to log in: ${e.toString()}");
    }
  }

  // Logout the current user
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.snackbar("Success", "User logged out successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to log out: ${e.toString()}");
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset email sent");
    } catch (e) {
      Get.snackbar("Error", "Failed to send password reset email: ${e.toString()}");
    }
  }
}
