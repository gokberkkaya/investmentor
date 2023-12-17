import 'package:flutter/material.dart';

loadCoinList(context){
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("deneme"),
      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close))
    ],),
    SizedBox(height: 20,),
    ListTile(
                        title: Text('Seçenek 1'),
                        onTap: () {
                          // Seçenek 1'e tıklandığında yapılacak işlemler
                        },
                      ),
                      ListTile(
                        title: Text('Seçenek 2'),
                        onTap: () {
                          // Seçenek 2'ye tıklandığında yapılacak işlemler
                        },
                      ),
                      ListTile(
                        title: Text('Kapat'),
                        onTap: () {
                           // Alt ekranı kapat
                        },
                      ),
  ],);
   
   
}