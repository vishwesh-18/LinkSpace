import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Loading state
  var isLoading = false.obs;

  // Function to handle login
  Future<void> loginUser() async {

    isLoading.value = true;

    try {

    } catch (error) {
      // Handle exceptions

    } finally {
      // Stop loading
      isLoading.value = false;
    }
  }
}
