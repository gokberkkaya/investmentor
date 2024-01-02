
import 'package:investmentor/src/getPrices.dart';
import 'package:investmentor/src/walletStatus.dart';

Future<List<Map<String, dynamic>>> detectArbitrage(double minPercent, double maxPercent) async {
  DateTime firstDate = DateTime.now();

  try {
    // Fetching data
    var [
      kucoinPrices,
      gatePrices,
      mexcPrices,
      huobiPrices,
      poloneixPrices,
      kucoinWalletStatus,
      gateWalletStatus,
      mexcWalletStatus,
      huobiWalletStatus,
      poloneixWalletStatus,
    ] = await Future.wait([
      getKucoinPrices(),
      getGatePrices(),
      getMexcPrices(),
      getHuobiPrices(),
      getPoloniexPrices(),
      getKucoinDepositAndWithdraw(),
      getGateDepositAndWithdraw(),
      getMexcDepositAndWithdraw(),
      getHuobiDepositAndWithdraw(),
      getPoloneixDepositAndWithdraw(),
    ]);

    DateTime secondDate = DateTime.now();
    print((secondDate.difference(firstDate)).inSeconds.toString() + " saniye verilerin gelmesi sürdü");

    sendArrForTradeStatus(String exchangeName) {
      switch (exchangeName) {
        case 'kucoin':
          return [1];
        case 'gate':
          return gatePrices;
        case 'mexc':
          return mexcPrices;
        case 'huobi':
          return huobiPrices;
        case 'poloneix':
          return poloneixPrices;
        default:
          return [];
      }
    }

    sendArrForWalletStatus(String exchangeName) {
      switch (exchangeName) {
        case 'kucoin':
          return kucoinWalletStatus;
        case 'gate':
          return gateWalletStatus;
        case 'mexc':
          return mexcWalletStatus;
        case 'huobi':
          return huobiWalletStatus;
        case 'poloneix':
          return poloneixWalletStatus;
        default:
          return [];
      }
    }

    // Updated for optimization
    Map<String, double> kucoinPricesMap = Map.fromIterable(kucoinPrices, key: (item) => item['name'], value: (item) => item['value']);
    Map<String, double> gatePricesMap = Map.fromIterable(gatePrices, key: (item) => item['name'], value: (item) => item['value']);
    Map<String, double> mexcPricesMap = Map.fromIterable(mexcPrices, key: (item) => item['name'], value: (item) => item['value']);
    Map<String, double> huobiPricesMap = Map.fromIterable(huobiPrices, key: (item) => item['name'], value: (item) => item['value']);
    Map<String, double> poloneixPricesMap = Map.fromIterable(poloneixPrices, key: (item) => item['name'], value: (item) => item['value']);

    Set<String> names = {...kucoinPricesMap.keys, ...gatePricesMap.keys, ...mexcPricesMap.keys, ...huobiPricesMap.keys, ...poloneixPricesMap.keys};

    List<Map<String, dynamic>> result = [];
    for (String name in names) {
      List<Map<String, dynamic>> values = [
        {'name': 'kucoin', 'value': kucoinPricesMap[name]},
        {'name': 'huobi', 'value': huobiPricesMap[name]},
        {'name': 'gate', 'value': gatePricesMap[name]},
        {'name': 'mexc', 'value': mexcPricesMap[name]},
        {'name': 'poloneix', 'value': poloneixPricesMap[name]},
      ].where((item) => item['value'] != null).toList();

      if (values.length < 2) continue;

      values.sort((a, b) => a['value'].compareTo(b['value']));

      double min = values[0]['value'];
      double max = values.last['value'];
      double percentDifference = (max - min) / min * 100;

      if (percentDifference >= minPercent && percentDifference <= maxPercent) {
        if (isAvailableForTransfer(name, sendArrForWalletStatus(values[0]['name']), sendArrForWalletStatus(values.last['name']))) {
          if (isAvailableForTrade(name, sendArrForTradeStatus(values[0]['name']), sendArrForTradeStatus(values.last['name']))) {
            result.add({
              'name': name,
              'minBorsa': values[0]['name'],
              'maxBorsa': values.last['name'],
              'minBorsaValue': values[0]['value'],
              'maxBorsaValue': values.last['value'],
              'percentDiff': getPercentDiff(values[0]['value'], values.last['value']).toStringAsFixed(2),
              'minBorsaLink': setLink(name, values[0]['name']),
              'maxBorsaLink': setLink(name, values.last['name']),
            });
          }
        }
      }
    }

    DateTime lastDate = DateTime.now();
    print((lastDate.difference(firstDate)).inSeconds.toString() + " saniye sürdü");
    print(result);

    return result;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

bool isAvailableForTransfer(String coinName, List<dynamic> minExchange, List<dynamic> maxExchange) {
  bool minExchangeWithdraw = false;
  bool maxExchangeDeposit = false;

  for (var i = 0; i < minExchange.length; i++) {
    if (minExchange[i]['currency'] == coinName) {
      minExchangeWithdraw = minExchange[i]['withdraw'];
    }
  }

  for (var i = 0; i < maxExchange.length; i++) {
    if (maxExchange[i]['currency'] == coinName) {
      maxExchangeDeposit = maxExchange[i]['deposit'];
    }
  }

  return minExchangeWithdraw && maxExchangeDeposit;
}

bool isAvailableForTrade(String coinName, List<dynamic> minExchange, List<dynamic> maxExchange) {
  double minExchangeAsk = 0;
  double maxExchangeBid = 0;

  if ((minExchange.isNotEmpty || maxExchange.isNotEmpty)) {
    return true;
  }

  for (var i = 0; i < minExchange.length; i++) {
    if (minExchange[i]['name'] == coinName) {
      minExchangeAsk = minExchange[i]['ask']?.toDouble() ?? 0;
    }
  }

  for (var i = 0; i < maxExchange.length; i++) {
    if (maxExchange[i]['name'] == coinName) {
      maxExchangeBid = minExchange[i]['bid']?.toDouble() ?? 0;
    }
  }

  return maxExchangeBid > minExchangeAsk;
}

String setLink(String coin, String borsa) {
  if (borsa == 'kucoin') {
    return 'https://www.kucoin.com/trade/${coin.toUpperCase()}-USDT';
  } else if (borsa == 'gate') {
    return 'https://www.gate.io/trade/${coin.toUpperCase()}_USDT';
} else if (borsa == 'mexc') {
return 'https://www.mexc.com/exchange/${coin.toUpperCase()}_USDT?_from=search_spot_trade';
} else if (borsa == 'huobi') {
return 'https://www.huobi.com/en-us/exchange/${coin.toLowerCase()}_usdt/';
} else if (borsa == 'poloneix') {
return 'https://poloniex.com/trade/${coin.toUpperCase()}_USDT?type=spot';
} else {
return '';
}
}

double getPercentDiff(double sayi1, double sayi2) {
double fark = (sayi1 - sayi2).abs();
double yuzdeFarki = (fark / sayi1) * 100;
return yuzdeFarki;
}
