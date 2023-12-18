import 'package:flutter/material.dart';

class LoadedCoins extends StatelessWidget {
  const LoadedCoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int lowerBound = -3;
    int upperBound = 10;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                      const TextSpan(
                        text: ' ile ',
                        style: TextStyle(
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
                      const TextSpan(
                        text: ' aralığındaki coinler',
                        style: TextStyle(
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
                          const Expanded(
                            child: Text(
                              'Alım-satım için uygunluk durumu',
                              style: TextStyle(
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
                      child: const Text(
                        'En ucuz olduğu borsa',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.17,
                      child: const Text('En pahalı olduğu borsa',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: const Text(
                        'İki borsa arası fark',
                        style: TextStyle(
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
                coinDetails('TRCL', true, 'Gate', 0.00140, 'Mexc', 0.00149,
                    6.15, context),
                lineBetweenCoins(),
                coinDetails('TRCL', true, 'Gate', 0.00140, 'Mexc', 0.00149,
                    6.15, context),
                lineBetweenCoins(),
                coinDetails('TRCL', false, 'Gate', 0.00140, 'Mexc', 0.00149,
                    6.15, context),
                lineBetweenCoins(),
                coinDetails('TRCL', true, 'Gate', 0.00140, 'Mexc', 0.00149,
                    6.15, context),
                lineBetweenCoins(),
                coinDetails('TRCL', false, 'Gate', 0.00140, 'Mexc', 0.00149,
                    6.15, context),
                lineBetweenCoins(),
                coinDetails('TRCL', true, 'Gate', 0.00140, 'Mexc', 0.00149,
                    6.15, context),
                lineBetweenCoins(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
              '500 dolara göre hesaplanmıştır. Eğer bu miktarda satış yapılabilecek talep yoksa coin kırmızı gösterilir.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Kapat'),
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
