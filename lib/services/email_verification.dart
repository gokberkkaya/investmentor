import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investmentor/login.dart';
import 'package:investmentor/mainPage.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();
    }

    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => checkEmailVerified(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;

      await user.sendEmailVerification();

      Flushbar(
        backgroundColor: Colors.green,
        message: "E-postana doğrulama bağlantısı gönderildi!",
        duration: Duration(seconds: 3),
      ).show(context);
    } on FirebaseAuthException catch (e) {
      Flushbar(
        backgroundColor: Colors.red,
        message: e.message!,
        duration: Duration(seconds: 3),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) =>
      isEmailVerified ? const MainPage() : const Login();
}
