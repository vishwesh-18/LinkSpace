import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:linkspace/LoginScreen.dart';
import 'package:linkspace/Service/AuthService.dart';


class RegistrationController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Authservice authservice=Authservice();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Loading state
  var isLoading = false.obs;


  // Simple method to add data to Firestore
  Future<void> addData() async {
    try {
      await _firestore.collection('users').doc(emailController.text.trim()).set({
        'name': nameController.text,       // User name
        'email': emailController.text,  // User email
        'createdAt': FieldValue.serverTimestamp(),  // Timestamp
      });
      print("Data added successfully!");
    } catch (e) {
      print("Error adding data: $e");
    }
  }


  // Function to register user
  Future<void> registerUser() async {


    try {
      authservice.registerWithEmailPassword(emailController.text, passwordController.text);

      addData();

      Get.offAll(LoginScreen());

    } catch (error) {
      // Error handling

    } finally {
      // Set loading to false
      isLoading.value = false;
    }
  }
}