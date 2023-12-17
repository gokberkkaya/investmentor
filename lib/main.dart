import 'package:flutter/material.dart';
import 'first_page.dart';
import 'splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color.fromARGB(1000 ,0, 198, 121), 
       
      ),
        home: SplashScreen(),
        routes: {
         '/firstpage': (context) => FirstPage(),

      },
    );
  }
}



