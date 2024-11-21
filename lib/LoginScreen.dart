import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkspace/HomeScreen.dart';
import 'package:linkspace/Service/GetServerKey.dart';
import 'package:linkspace/Service/NotificationService.dart';
import 'package:linkspace/SignupScreen.dart';
import 'package:logger/logger.dart';




class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  NotificationService notificationService = NotificationService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GetServerKey getServerKey =GetServerKey();
  Logger logger = Logger();

  // GetX state management for loading and error message
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Color(0xFF232F3E), // Amazon Blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          return ListView(
            children: [
              SizedBox(height: 20),
              // Email TextField
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Color(0xFF232F3E)), // Amazon Blue
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFFF9900), width: 2), // Amazon Yellow
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15),

              // Password TextField
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color(0xFF232F3E)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFF9900), width: 2),
                  ),
                ),
              ),
              SizedBox(height: 25),

              // Display error message if any
              if (errorMessage.isNotEmpty) ...[
                Text(
                  errorMessage.value,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
              ],

              // Login Button
              ElevatedButton(
                //
                onPressed: isLoading.value ? null : _loginUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF9900), // Amazon Yellow
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: isLoading.value
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
              SizedBox(height: 15),

              // Forgot Password Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      print('tapped');

                      var key= await getServerKey.getServerKey();
                      logger.i(key);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF232F3E), // Amazon Blue
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xFF232F3E)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(SignupScreen());
                      // Handle navigation to Register screen
                    },
                    child: Text(
                      "Create one",
                      style: TextStyle(
                        color: Color(0xFFFF9900), // Amazon Yellow
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  // Login function
// Login function
  Future<void> _loginUser() async {
    isLoading.value = true;
    errorMessage.value = ''; // Reset error message

    final email = _emailController.text;
    final password = _passwordController.text;


    // Sign in the user with Firebase Auth
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    var key= getServerKey.getServerKey();
    logger.i(key);


    var token = await notificationService.getFCMToken();

    if (token != null) {
      // Store user data in Firestore
      await _firestore.collection('users').doc(email).update({
        'email': email,
        'token': token,
        'signinAt': FieldValue
            .serverTimestamp(), // You can store the user's creation timestamp if needed
      });
      isLoading.value = false;
      print("Success");

      Get.snackbar('Success', 'Login successful');


       Get.offAll(HomeScreen());

    }

    // Stop the loading state
  }
}
