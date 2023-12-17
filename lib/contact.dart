import 'package:flutter/material.dart';


class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  double marginOfHigh= 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
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
              'İletişim Bilgileri',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),SizedBox(height: marginOfHigh,),
            TextFormField(
                decoration:const InputDecoration(
                  labelText: "Kullanıcı adı",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),SizedBox(height: marginOfHigh,),
               TextFormField(
                decoration:const InputDecoration(
                  labelText: "Doğum Günü",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),SizedBox(height: marginOfHigh,),
               TextFormField(
                decoration:const InputDecoration(
                  labelText: "Cinsiyet",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),SizedBox(height: marginOfHigh,),
               TextFormField(
                decoration:const InputDecoration(
                  labelText: "E-posta",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),SizedBox(height: marginOfHigh,),
               TextFormField(
                decoration:const InputDecoration(
                  labelText: "Telefon Numarası",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),  SizedBox(height: marginOfHigh,),
              TextFormField(
                decoration:const InputDecoration(
                  labelText: "Adres",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ), SizedBox(height: marginOfHigh*2,),
              ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Oval hale getir
                ),
                primary:const Color.fromARGB(1000 ,0, 198, 121), // Yeşil renk
              ),
              
              child: const Padding(
                
                padding:  EdgeInsets.all(10.0),
                child: Text(
                  'Güncelle',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              )
    
             
              
          ],
      
          ),
      )
      ),
    );
  }
}