import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(),
        routes: {
         '/firstpage': (context) => FirstPage(), 
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      
      Navigator.of(context).pushReplacementNamed('/firstpage');
    });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 35, 62),
      body: Center(
        child: Image.asset('images/yatay.png',),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1000, 244, 244, 244),
      body: Center(
        child: Expanded(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/giris.png'), // Resmi değiştir
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tek tuşla kripto \ndünyasına hakim ol',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Farklı kripto para borsalarında listelenen\ncoinlerin fiyatlarında meydana gelen\n yüzdelik farkları tespit et',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              
              onPressed: () {
                // Butona tıklandığında yapılacak işlemler
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Kenarları oval yap
                ),
                backgroundColor: const Color.fromARGB(1000 ,0, 198, 121), // Buton rengini değiştir
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Hesap Oluştur',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(onPressed: (){}, child: const Text('Giriş Yap', style: TextStyle(color:Color.fromARGB(1000 ,0, 198, 121),),))
          ],
        ),)
      
      ),
      
    );
  }
}