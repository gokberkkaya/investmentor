import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';

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
            /* Row(mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                },
            ),
            
            ],), */
            
          const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('search_coin_title'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
             const SizedBox(height: 60),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.translate('search_coin_coin_select_label'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                suffixIcon: const Icon(Icons.arrow_drop_down),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 1, 50), backgroundColor: const Color.fromARGB(1000 ,0, 198, 121),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Oval hale getir
                ), // Yeşil renk
              ),
              
              child: Padding(
                
                padding:  const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context)!.translate('search_coin_search_button'),
                  style: const TextStyle(fontSize: 18),
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