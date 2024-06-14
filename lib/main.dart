import 'package:flutter/material.dart';
import 'package:investmentor/languages.dart';
import 'splash_screen.dart';
import 'first_page.dart';
import 'create_account.dart';
import 'contact.dart';
import 'nofication.dart';
import 'search_coin.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(),
        routes: {
         '/firstpage': (context) => FirstPage(),
         '/contact': (context) => Contact(),
         '/create_account':(context) => CreateAccount(), 
         '/nofication':(context) => Nofication(), 
         '/search_coin':(context) => SearchCoin(),
         '/languages':(context) => Languages()
      },
    );
  }
}



