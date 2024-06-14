import 'package:flutter/material.dart';

class showSearchedCoin extends StatelessWidget {
  final data;
  const showSearchedCoin({required this.data});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Text("Aranan Coin:", style: TextStyle(
                        fontSize: 21,
                        
                        fontWeight: FontWeight.bold,
                      ),),  
                IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              ]),
             ),
             Container(
              padding: EdgeInsets.all(8.0),
              child: data,
             )
          ],
        ),
      ),
    );
  }
}