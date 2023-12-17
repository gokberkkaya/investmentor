import 'package:flutter/material.dart';


class Nofication extends StatefulWidget {
  const Nofication({super.key});

  @override
  State<Nofication> createState() => _NoficationState();
}

class _NoficationState extends State<Nofication> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.start, 
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
           const Row(
             mainAxisAlignment: MainAxisAlignment.center, 
            children:[
              Text(
               'Bildirimler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
            ),]
             
          ),
      // buradan başlıyor
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [

                Text(
                  "3 gündür seni göremedik, yatırımlarını kontrol etmek ister misin?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(height: 15),
                   Text(
                  "15dk önce",
                  style: TextStyle(fontSize: 12, color: Color.fromARGB(112, 112, 112, 1)),
                  textAlign: TextAlign.end,
                  )
              ],
            ),
             SizedBox(height: 15),
            Divider(),
            SizedBox(height: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                Text(
                  "İletişim bilgilerini hala güncellemedin,güncellemeye ne dersin?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(height: 15),
                   Text(
                  "3sa önce",
                  style: TextStyle(fontSize: 12, color: Color.fromARGB(112, 112, 112, 1)),
                  textAlign: TextAlign.end,
                  )
              ],
            ),
             SizedBox(height: 15),
            Divider(),
            const SizedBox(height: 60),
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                Text(
                  "3 gündür seni göremedik, yatırımlarını kontrol etmek ister misin?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(height: 15),
                   Text(
                  "15dk önce",
                  style: TextStyle(fontSize: 12, color: Color.fromARGB(112, 112, 112, 1)),
                  textAlign: TextAlign.end,
                  )
              ],
            ),
             SizedBox(height: 15),
            Divider(),
            SizedBox(height: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                Text(
                  "İletişim bilgilerini hala güncellemedin,güncellemeye ne dersin?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(height: 15),
                   Text(
                  "3sa önce",
                  style: TextStyle(fontSize: 12, color: Color.fromARGB(112, 112, 112, 1)),
                  textAlign: TextAlign.end,
                  )
              ],
            ),
             SizedBox(height: 15),
            Divider(),
            const SizedBox(height: 60),
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                Text(
                  "3 gündür seni göremedik, yatırımlarını kontrol etmek ister misin?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(height: 15),
                   Text(
                  "15dk önce",
                  style: TextStyle(fontSize: 12, color: Color.fromARGB(112, 112, 112, 1)),
                  textAlign: TextAlign.end,
                  )
              ],
            ),
             SizedBox(height: 15),
            Divider(),
            SizedBox(height: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                Text(
                  "İletişim bilgilerini hala güncellemedin,güncellemeye ne dersin?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(height: 15),
                   Text(
                  "3sa önce",
                  style: TextStyle(fontSize: 12, color: Color.fromARGB(112, 112, 112, 1)),
                  textAlign: TextAlign.end,
                  )
              ],
            ),
             SizedBox(height: 15),
            Divider(),

          ],
        ),
      ),
    );
  }
}