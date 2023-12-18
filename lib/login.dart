import 'package:flutter/material.dart';
import 'package:investmentor/mainPage.dart';

import 'reset_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                },
            ),
            ],),
            
          const SizedBox(height: 10),
            const Text(
              'Giriş Yap',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 10),
            
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 1, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Oval hale getir
                ),
                primary: Color.fromARGB(1000 ,0, 198, 121), // Yeşil renk
              ),
              
              child: const Padding(
                
                padding:  EdgeInsets.all(10.0),
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPassword(),
                  ),
                );
            }, 
            child: const Text('Şifremi Unuttum', style: TextStyle(color:Color.fromARGB(1000 ,0, 198, 121), fontSize: 16),))
          ],
        ),
      ),
    );
  }
}