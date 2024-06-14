import 'package:flutter/material.dart';
import 'package:investmentor/mainPage.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 'loggedUserId' anahtarını kontrol edin, eğer varsa ve null değilse true döndürün
    String? userId = prefs.getString('loggedUserId');
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA:$userId");
    return userId != null;
  }

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    Timer(Duration(seconds: 1), () {
      
      Navigator.of(context).pushReplacementNamed('/languages');
=======
    Timer(Duration(seconds: 1), () async {
      bool loggedIn = await isUserLoggedIn();
      if (loggedIn) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage()));
      } else {
        // Kullanıcı giriş yapmamışsa, giriş sayfasına yönlendir
        Navigator.of(context).pushReplacementNamed('/firstpage');
      }
>>>>>>> 1c352a13602d1aab9b2372d9767a64365936c917
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 35, 62),
      body: Center(
        child: Image.asset(
          'assets/images/yatay.png',
        ),
      ),
    );
  }
}
