import 'package:flutter/material.dart';
import 'package:investmentor/contact.dart';
import 'package:investmentor/first_page.dart';
import 'package:investmentor/languages.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.all(40.0), 
        child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              'Profil',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Color.fromARGB(1000 ,0, 198, 121),
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ahmet Kaplan',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Bilgisayar Mühendisi',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width ,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contact(),
                  ),
                );
                },
                style: ElevatedButton.styleFrom(
                  
                  padding: EdgeInsets.all(20.0),
                  primary: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.contacts, color: Colors.black,),
                    Text(
                      'İletişim Bilgileri',
                      style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width ,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Languages(),
                  ),
                );
                },
                style: ElevatedButton.styleFrom(
                  
                  padding: EdgeInsets.all(20.0),
                  primary: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.language, color: Colors.black,),
                    Text(
                      'Dil',
                      style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,),
                  ],
                ),
              ),
            ),
             SizedBox(height: 20),
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width ,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(),
                  ),
                );
                },
                style: ElevatedButton.styleFrom(
                  
                  padding: EdgeInsets.all(20.0),
                  primary: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.logout, color: Colors.black,),
                    Text(
                      'Çıkış Yap',
                      style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,),
                  ],
                ),
              ),
            ),
          ],
        )
        ,)
        
        
       ,
      ),
    );
  }
}