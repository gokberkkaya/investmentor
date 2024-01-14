import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';

class LoadedCoins extends StatelessWidget {
  final data;
  final maximumValue;
  final minimumValue;
  const LoadedCoins({required this.data,  this.maximumValue,this.minimumValue});

  @override
  Widget build(BuildContext context) {
    int lowerBound = int.parse(minimumValue);
    int upperBound =int.parse(maximumValue);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(40, 30, 25, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '$lowerBound%',
                      style: TextStyle(
                        fontSize: 17,
                        color: lowerBound < 0 ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!
                              .translate('loaded_coins_and'),
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '$upperBound%',
                          style: TextStyle(
                            fontSize: 17,
                            color: upperBound < 0 ? Colors.red : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!
                              .translate('loaded_coins_range'),
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Yatayda başlangıç ve sona hizalama
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Dikeyde merkeze hizalama
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('loaded_coins_suitability_status'),
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                                softWrap:
                                    true, // Metin içeriği eğer sığmıyorsa alt satıra geç
                              ),
                            ),
                            const SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                showInfoDialog(context);
                              },
                              child: const Icon(
                                Icons.info,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.17,
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate('loaded_coins_cheapest_exchange'),
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.17,
                        child: Text(
                            AppLocalizations.of(context)!.translate(
                                'loaded_coins_most_expensive_exchange'),
                            style: const TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate('loaded_coins_price_difference'),
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 0.2,
                    thickness: 0.2,
                    indent: 0,
                    endIndent: 0,
                  ),
                 SizedBox(
                   child: Expanded(child: SingleChildScrollView(child: Column(
                        children: <Widget>[
                          for (int i = 0; i < data.length; i++)
                            Column(
                              children: [
                                coinDetails(
                                  data[i]['name'],
                                  true,
                                  data[i]['minBorsa'],
                                  data[i]['minBorsaValue'],
                                  data[i]['maxBorsa'],
                                  data[i]['maxBorsaValue'],
                                  double.parse(data[i]['percentDiff']),
                                  context,
                                ),
                                lineBetweenCoins(),
                              ],
                            ),
                        ],
                      ),)),
                 )
                 
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(AppLocalizations.of(context)!
              .translate('loaded_coins_info_dialog_content')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!
                  .translate('loaded_coins_close_button')),
            ),
          ],
        );
      },
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
