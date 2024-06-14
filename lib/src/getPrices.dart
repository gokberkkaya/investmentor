import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> getAllPricesExchanges() async {
  final List<Future<List<Map<String, dynamic>>>> exchangeFutures = [
    getPoloniexPrices(),
    getMexcPrices(),
    getKucoinPrices(),
    getGatePrices(),
    getHuobiPrices(),
  ];

  final List<List<Map<String, dynamic>>> exchanges = await Future.wait(exchangeFutures);

  final allDepth = exchanges.expand((element) => element).toList();

  return allDepth;
}



Future<List<Map<String, dynamic>>> getPoloniexPrices() async {
  try {
    final response = await http.get(Uri.parse('https://api.poloniex.com/markets/ticker24h'));
    
    final data = json.decode(response.body);

    List<Map<String, dynamic>> values = [];

    for (int i = 0; i < data.length; i++) {
      String symbol = data[i]['symbol'];
    
      if (symbol.endsWith('_USDT')) {

        values.add({
          'name': symbol.substring(0, symbol.length - 5), // USDT_ kelimesini kaldır
          'value':double.parse(data[i]['close']),
          'bid':  double.parse(data[i]['bid']),
          'ask':  double.parse(data[i]['ask']),
        });
      }
    }

    print('poloniex');
    return values;
  } catch (error) {
    print('Hata oluştu: $error');
    return [];
  }
}


Future<List<Map<String, dynamic>>> getMexcPrices() async {
  try {
    final response = await http.get(Uri.parse('https://www.mexc.com/open/api/v2/market/ticker'));
    final data = json.decode(response.body)['data'];

    List<Map<String, dynamic>> values = [];

    for (int i = 0; i < data.length; i++) {
      String symbol = data[i]['symbol'];
      if (symbol.contains('_USDT') &&
          !symbol.contains('5S_') &&
          !symbol.contains('5L_') &&
          !symbol.contains('4S_') &&
          !symbol.contains('4L_') &&
          !symbol.contains('3S_') &&
          !symbol.contains('3L_') &&
          !symbol.contains('2S_') &&
          !symbol.contains('2L_')) {
        values.add({
          'name': symbol.substring(0, symbol.length - 5),
          'value': double.parse(data[i]['last']),
          'bid':   double.parse(data[i]['bid']),
          'ask':   double.parse(data[i]['ask']),
        });
      }
    }

    print('mexc');
    return values;
  } catch (error) {
    print('Hata oluştu: $error');
    return [];
  }
}


Future<List<Map<String, dynamic>>> getKucoinPrices() async {
  try {
    final response = await http.get(Uri.parse('https://api.kucoin.com/api/v1/prices?base=usd'));
    final data = json.decode(response.body)['data'];

    List<Map<String, dynamic>> values = [];

    for (final key in data.keys) {
      values.add({'name': key, 'value': double.parse(data[key])});
    }

    print('kucoin');
    return values;
  } catch (error) {
    print('Hata oluştu: $error');
    return [];
  }
}


Future<List<Map<String, dynamic>>> getGatePrices() async {
  try {
    final response = await http.get(Uri.parse('https://api.gateio.ws/api/v4/spot/tickers'));
    final data = json.decode(response.body);

    List<Map<String, dynamic>> values = [];

    for (int i = 0; i < data.length; i++) {
      String currencyPair = data[i]['currency_pair'];
      if (currencyPair.endsWith('_USDT') &&
          !currencyPair.contains('5S_') &&
          !currencyPair.contains('5L_') &&
          !currencyPair.contains('4S_') &&
          !currencyPair.contains('4L_') &&
          !currencyPair.contains('3S_') &&
          !currencyPair.contains('3L_') &&
          !currencyPair.contains('2S_') &&
          !currencyPair.contains('2L_')) {
          
        values.add({
          'name': currencyPair.substring(0, currencyPair.length - 5),
          'value': double.tryParse(data[i]['last']) ?? 0,
          'bid':   double.tryParse(data[i]['highest_bid']) ?? 0,
          'ask':   double.tryParse(data[i]['lowest_ask']) ?? 0,
        });
      }
    }

    print('gate');
    return values;
  } catch (error) {
    print('Hata oluştu: $error');
    return [];
  }
}



Future<List<Map<String, dynamic>>> getHuobiPrices() async {
  try {
    final response = await http.get(Uri.parse('https://api.huobi.pro/market/tickers'));
    final data = json.decode(response.body)['data'];

    List<Map<String, dynamic>> values = [];

    for (int i = 0; i < data.length; i++) {
      String symbol = data[i]['symbol'];
      if (symbol.endsWith('usdt')) {
    
    
        values.add({
          'name': symbol.substring(0, symbol.length - 4).toUpperCase(),
          'value': (data[i]['close']),
          'bid': (data[i]['bid']),
          'ask': (data[i]['ask']),
        });
      }
    }

    print('huobi');
    return values;
  } catch (error) {
    print('Hata oluşhjtu: $error');
    return [];
  }
}