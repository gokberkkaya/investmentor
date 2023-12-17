import 'package:flutter/material.dart';

class SearchCoin extends StatefulWidget {
  const SearchCoin({super.key});

  @override
  State<SearchCoin> createState() => _SearchCoinState();
}

class _SearchCoinState extends State<SearchCoin> {
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
              'Coin Ara',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),SizedBox(height: 20.0,),
             const SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Coin Seç',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                
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
                  'Ara',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            




          ],
      
          ),
      )
      ),
    );
             
          
  }
}