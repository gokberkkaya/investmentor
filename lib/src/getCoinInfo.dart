

import 'package:investmentor/src/getDepths.dart';

class CoinData {
  String borsa;
  List<Map<String, dynamic>> bids;
  List<Map<String, dynamic>> asks;

  CoinData({required this.borsa, required this.bids, required this.asks});
}

Future takeAvg(String coinName) async {
  try {
    List<Map<String, dynamic>> allDepthData = await getAllDepthExchanges(coinName);

    final List<Map<String, dynamic>> aviableBids = [];
    final List<Map<String, dynamic>> aviableAsks = [];

    for (Map<String, dynamic> exchangeData in allDepthData) {
      double sum = 0;
      double amount = 0;

      for (List<dynamic> bid in exchangeData['bids']) {
        sum += double.parse(bid[0].toString()) * double.parse(bid[1].toString());
        amount += double.parse(bid[1].toString());

        if (sum >= 500) {
          aviableBids.add({
            'borsaName': exchangeData['borsa'],
            'sum': sum,
            'amount': amount,
            'avg': sum / amount,
          });

          break;
        }
      }

      sum = 0;
      amount = 0;

      for (List<dynamic> ask in exchangeData['asks']) {
        sum += double.parse(ask[0].toString()) * double.parse(ask[1].toString());
        amount += double.parse(ask[1].toString());

        if (sum >= 500) {
          aviableAsks.add({
            'borsaName': exchangeData['borsa'],
            'sum': sum,
            'amount': amount,
            'avg': sum / amount,
          });

          break;
        }
      }
    }

    return CoinData(borsa: 'gate', bids: aviableBids, asks: aviableAsks);
  } catch (e) {
    print('Error in takeAvg: $e');
    return null;
  }
}

Future<Map<String, dynamic>> diff(CoinData? coinData) async {
  try {
    if (coinData == null || coinData.bids.isEmpty || coinData.asks.isEmpty) {
      return {
        'state': false,
        'diff': 0,
        'exchanges': [],
      };
    }

    int bidsLen = coinData.bids.length;
    int asksLen = coinData.asks.length;

    double biggestPriceForSelling = coinData.bids[0]['avg'];
    double lowerPriceForBuying = coinData.asks[0]['avg'];
    String minBorsa = coinData.bids[0]['borsaName'];
    String maxBorsa = coinData.asks[0]['borsaName'];

    for (int i = 0; i < bidsLen; i++) {
      if (coinData.bids[i]['avg'] > biggestPriceForSelling) {
        biggestPriceForSelling = coinData.bids[i]['avg'];
        minBorsa = coinData.bids[i]['borsaName'];
      }
    }

    for (int i = 0; i < asksLen; i++) {
      if (coinData.asks[i]['avg'] < lowerPriceForBuying) {
        lowerPriceForBuying = coinData.asks[i]['avg'];
        maxBorsa = coinData.asks[i]['borsaName'];
      }
    }

    if (lowerPriceForBuying < biggestPriceForSelling) {
      return {
        'state': true,
        'diff': (biggestPriceForSelling - lowerPriceForBuying) / lowerPriceForBuying * 100,
        'exchanges': [
          [minBorsa, lowerPriceForBuying],
          [maxBorsa, biggestPriceForSelling]
        ],
      };
    } else {
      return {
        'state': false,
        'diff': (biggestPriceForSelling - lowerPriceForBuying) / lowerPriceForBuying * 100,
        'exchanges': [
          [minBorsa, lowerPriceForBuying],
          [maxBorsa, biggestPriceForSelling]
        ],
      };
    }
  } catch (e) {
    print('Error in diff: $e');
    return {
      'state': false,
      'diff': 0,
      'exchanges': [],
    };
  }
}