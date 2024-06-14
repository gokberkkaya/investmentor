import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1000, 244, 244, 244),
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
            
            Text(
              AppLocalizations.of(context)!.translate('404_ops'),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, ),
            ),
            const SizedBox(height: 5),
            Text(
              AppLocalizations.of(context)!.translate('404_message'),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

