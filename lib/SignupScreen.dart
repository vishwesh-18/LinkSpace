import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkspace/LoginScreen.dart';
import 'package:linkspace/controller/SignupController.dart';



class SignupScreen extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: Color(0xFF232F3E),
        title: Text("Amazon Registration"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF232F3E),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: "Name",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: "Email",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: controller.confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: controller.registerUser,
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFFFF9900),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text("Create Account"),
            ),
            SizedBox(height: 20),

            // Register Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Color(0xFF232F3E)),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(LoginScreen());
                    // Handle navigation to Register screen
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: Color(0xFFFF9900), // Amazon Yellow
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
