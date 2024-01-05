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
  return prefs.getBool('isLoggedIn') ?? false;
}


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () async {
      
      if(await isUserLoggedIn()){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage()));
      }else{
        Navigator.of(context).pushReplacementNamed('/firstpage');
      }
     
    });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 35, 62),
      body: Center(
        child: Image.asset('assets/images/yatay.png',),
      ),
    );
  }
}
