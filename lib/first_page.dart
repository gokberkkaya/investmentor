import 'package:flutter/material.dart';
import 'package:investmentor/create_account.dart';
import 'package:investmentor/login.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1000, 244, 244, 244),
      body: Padding(padding: const EdgeInsets.all(40.0),
      child: Center(
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
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccount(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 1, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Kenarları oval yap
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
            TextButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
            }, 
            child: 
            const Text('Giriş Yap', style: TextStyle(color:Color.fromARGB(1000 ,0, 198, 121),fontSize: 16),))
          ],
        ),)
      
      ),) 
      
      
    );
  }
}