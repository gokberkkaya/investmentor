import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1000, 244, 244, 244),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/error.png'), // Resmi değiştir
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            const Text(
              'Opsss!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Bir şeyler ters gitti,\nlütfen tekrar dene',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

