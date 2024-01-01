import 'package:flutter/material.dart';
import 'first_page.dart';
import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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



