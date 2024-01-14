import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investmentor/mainPage.dart';
import 'package:investmentor/login.dart';
import 'package:investmentor/services/email_verification.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> loginStateSave() async {
    // Kullanıcı girişi başarılıysa
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLoggedIn', true);
  }

  Future<void> signUp(BuildContext context, {
    required String name,
    required String email,
    required String password
  }) async {
    final navigator = Navigator.of(context);

    try {
      final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;

      if (user != null) {
        _registerUser(name: name, email: email, password: password, uid: user.uid);

        Flushbar(
          message: "E-postana doğrulama bağlantısı gönderildi!",
          duration: Duration(seconds: 3),
        ).show(context);

        navigator.push(MaterialPageRoute(builder: (context) => const EmailVerification()));
      }
    } on FirebaseAuthException catch (e) {
      Flushbar(
          message: e.message!,
          duration: Duration(seconds: 3),
        ).show(context);
      
    }
  }

  Future<void> signIn(BuildContext context, {
    required String email,
    required String password
  }) async {
    final navigator = Navigator.of(context);
  
    try {
      final UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        navigator.push(MaterialPageRoute(builder: (context) => const MainPage()));
        loginStateSave();
      }
    } on FirebaseAuthException catch (e) {
      Flushbar(
          message: e.message!,
          duration: Duration(seconds: 3),
        ).show(context);
    }
  }

  Future<void> _registerUser({
    required String name,
    required String email,
    required String password,
    required String uid
  }) async {
    await userCollection.doc(uid).set({
      "name": name,
      "email": email,
      "password": password
    });
  }

  Future<void> resetPassword(BuildContext context, {
    required String email
  }) async {
    final navigator = Navigator.of(context);

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Flushbar(
          message: "Şifre sıfırlama e-postası gönderildi!",
          duration: Duration(seconds: 3),
        ).show(context);
      
      navigator.push(MaterialPageRoute(builder: (context) => const Login()));
    } on FirebaseAuthException catch (e) {
      Flushbar(
          message: e.message!,
          duration: Duration(seconds: 3),
        ).show(context);
    }
  }
}