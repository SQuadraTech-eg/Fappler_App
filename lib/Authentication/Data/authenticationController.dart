import 'package:fapplerv2/Authentication/Application/authenticationFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  static SignUpController get instance => Get.find();

  final  fullName = TextEditingController();
  final  age = TextEditingController();
  final  address = TextEditingController();
  final relationType = " ".obs;
  final gender = " ".obs;
  final email = TextEditingController();
  final password = TextEditingController();


  void registerUser(String email, String password){
    FirebaseAuthentication.instance.createUserWithEmailAndPassword(email, password);
  }

}