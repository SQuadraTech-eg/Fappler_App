import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Home/Application/welcomeScreen.dart';
import '../Presentation/Screens/login.dart';

class FirebaseAuthentication extends GetxController{
  static FirebaseAuthentication get instance => Get.find();

  //those variables are responsible for user credentials
  // and user state and data
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  //this method will be executed everytime the user starts the app
  //it will check if credentials exists or no ,
  // and will listen for any authentication changes like sign out
  @override
  void onReady() {
    // TODO: implement onReady
    Future.delayed(Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setIntialScreen);
    super.onReady();
  }

  //this method will be invoked whenever a change in firebase
  _setIntialScreen(User? user){

    user == null ? Get.offAll(() => Login()) : Get.offAll(() => WelcomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password)async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null? Get.offAll(() => WelcomeScreen()) : Get.to(() => Login());
    } on FirebaseAuthException catch(e){

    } catch (_){}
  }


  Future<void> LoginUserWithEmailAndPassword(String email, String password)async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){

    } catch (_){}
  }

  Future<void> logout() async => _auth.signOut();

}