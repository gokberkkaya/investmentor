
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:investmentor/mainPage.dart';
import 'package:investmentor/login.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(BuildContext context, {
    required String name,
    required String email,
    required String password
  }) async {
    final navigator = Navigator.of(context);

    try {
      final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _registerUser(name: name, email: email, password: password);

        Fluttertoast.showToast(
          msg: "Hesap Oluşturma Başarılı!",
          toastLength: Toast.LENGTH_LONG
        );

        navigator.push(MaterialPageRoute(builder: (context) => const Login()));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
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
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> _registerUser({
    required String name,
    required String email,
    required String password
  }) async {
    await userCollection.doc().set({
      "name": name,
      "email": email,
      "password": password
    });
  }
}