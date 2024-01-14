import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';
import 'package:investmentor/coin_Search.dart';
import 'package:investmentor/showModalBottom.dart';
import 'package:investmentor/src/getCoinInfo.dart';



class SearchCoin extends StatefulWidget {
  const SearchCoin({super.key});

  @override
  State<SearchCoin> createState() => _SearchCoinState();
}

class _SearchCoinState extends State<SearchCoin> {
  TextEditingController coinName = TextEditingController();
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
              controller: coinName,
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
              onPressed: ()async {
               
                var dataSimple = await takeAvg(coinName.text);
                var dataV =await diff(dataSimple);
                print(dataV['diff'].runtimeType);
                
                showModalBottom(context, showSearchedCoin(data: coinDetails(coinName.text.toUpperCase(),dataV['state'],dataV['exchanges'][0][0], dataV['exchanges'][0][1], dataV['exchanges'][1][0], dataV['exchanges'][1][1], double.parse(dataV['diff'].toStringAsFixed(2)), context)),0.4);
                

               
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 1, 50), backgroundColor: const Color.fromARGB(1000 ,0, 198, 121),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Oval hale getir
                ),  
                 
              ),
              
              child: Padding(
                
                padding:  const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context)!.translate('search_coin_search_button'),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          const SizedBox(height: 30),
              
            




          ],
      
          ),
      )
      ),
    );
             
          
  }

   Widget coinDetails(
      String coinName,
      bool coinStatus,
      String cheapStockMarketName,
      double cheapPrice,
      String expensiveStockMarketName,
      double expensivePrice,
      double priceDifference,
      BuildContext context) {
   
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            coinName,
            style: TextStyle(
              fontSize: 12,
              color: coinStatus == true ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.17,
          child: Column(
            children: [
              Text(
                cheapStockMarketName,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$cheapPrice\$',
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.17,
          child: Column(
            children: [
              Text(
                expensiveStockMarketName,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$expensivePrice\$',
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.15,
          child: Text(
            '$priceDifference%',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget lineBetweenCoins() {
    return const Divider(
      color: Colors.grey,
      height: 0.1,
      thickness: 0.1,
      indent: 0,
      endIndent: 0,
    );
  }
}