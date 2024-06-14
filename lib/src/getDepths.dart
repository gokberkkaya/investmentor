import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<Map<String, dynamic>>> getAllDepthExchanges(String coin) async {
  final allDepth = [];

  final List<Future<Map<String, dynamic>?>> exchangeFutures = [
    getKucoinDepthPromise(coin),
    getHuobiDepthPromise(coin),
    getGateDepthPromise(coin),
    getMexcDepthPromise(coin),
    getPoloniexDepthPromise(coin),
  ];

  final List<Map<String, dynamic>?> exchanges = await Future.wait(exchangeFutures.map((future) => future.catchError((error) => null)));

  allDepth.addAll(exchanges);

  final result = allDepth.where((element) => element != null).cast<Map<String, dynamic>>().toList();

  return result;
}




Future<Map<String, dynamic>?> getKucoinDepthPromise(String coin) async {
  try {
    final response = await http.get(Uri.parse('https://api.kucoin.com/api/v1/market/orderbook/level2_20?symbol=${coin.toUpperCase()}-USDT'));

    if (response.statusCode == 200) {
      // Başarılı bir cevap alındıysa
      Map<String, dynamic> responseData = json.decode(response.body);
      
      List<dynamic>? bids = responseData['data']['bids'];
      List<dynamic>? asks = responseData['data']['asks'];

      if (bids == null || asks == null) {
        return null;
      } else {
        return {
          'borsa': 'kucoin',
          'bids': bids,
          'asks': asks,
        };
      }
    } else {
      // Başarısız bir cevap alındıysa
      return null;
    }
  } catch (error) {
    // Hata durumunda
    print('Hata oluştu: $error');
    return null;
  }
}

Future<Map<String, dynamic>?> getHuobiDepthPromise(String coin) async {
  try {
    final response = await http.get(Uri.parse('https://api.huobi.pro/market/depth?symbol=${coin.toLowerCase()}usdt&type=step0&depth=20'));

    if (response.statusCode == 200) {
      // Başarılı bir cevap alındıysa
      Map<String, dynamic> responseData = json.decode(response.body);
      
      List<dynamic>? bids = responseData['tick']['bids'];
      List<dynamic>? asks = responseData['tick']['asks'];

      if (bids == null || asks == null) {
        return null;
      } else {
        return {
          'borsa': 'huobi',
          'bids': bids,
          'asks': asks,
        };
      }
    } else {
      // Başarısız bir cevap alındıysa
      return null;
    }
  } catch (error) {
    // Hata durumunda
    print('Hata oluştu: $error');
    return null;
  }
}


Future<Map<String, dynamic>?> getGateDepthPromise(String coin) async {
  try {
   
    final response = await http.get(Uri.parse('https://api.gateio.ws/api/v4/spot/order_book?currency_pair=${coin}_USDT&limit=20'));
   
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      List<dynamic>? bids = responseData['bids'];
      List<dynamic>? asks = responseData['asks'];
      if (bids == null || asks == null) {
        return null;
      } else {
        return {
          'borsa': 'gate',
          'bids': bids,
          'asks': asks,
        };
      }
    } else {   
      return null;
    }
  } catch (error) {
    print('Hata oluştu: $error');
    return null;
  }
}
Future<Map<String, dynamic>?> getMexcDepthPromise(String coin) async {
  try {
    final response = await http.get(Uri.parse('https://www.mexc.com/open/api/v2/market/depth?symbol=${coin.toUpperCase()}_USDT&depth=20'));

    if (response.statusCode == 200) {
      // Başarılı bir cevap alındıysa
      Map<String, dynamic> responseData = json.decode(response.body);

      List<dynamic> bids = [];
      List<dynamic> asks = [];

      for (var j = 0; j < 20; j++) {
        bids.add([responseData['data']['bids'][j]['price'], responseData['data']['bids'][j]['quantity']]);
        asks.add([responseData['data']['asks'][j]['price'], responseData['data']['asks'][j]['quantity']]);
      }

      return {
        'borsa': 'mexc',
        'bids': bids,
        'asks': asks,
      };
    } else {
      // Başarısız bir cevap alındıysa
      return null;
    }
  } catch (error) {
    // Hata durumunda
    print('Hata oluştu: $error');
    return null;
  }
}

Future<Map<String, dynamic>?> getPoloniexDepthPromise(String coin) async {
  try {
    final response = await http.get(Uri.parse('https://api.poloniex.com/markets/${coin.toUpperCase()}_USDT/orderBook'));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);

      List<dynamic> bids = responseData['bids'];
      List<dynamic> asks = responseData['asks'];

      // ignore: unnecessary_null_comparison
      if (bids == null || asks == null) {
        return null;
      } else {
        List<List<double>> parsedBids = [];
        List<List<double>> parsedAsks = [];

        for (int i = 0; i < bids.length; i += 2) {
          try {
            double price = double.parse(bids[i].toString().replaceAll(',', ''));
            double quantity = double.parse(bids[i + 1].toString().replaceAll(',', ''));
            parsedBids.add([price, quantity]);
          } catch (e) {
            print('Geçersiz double değeri: ${bids[i]} veya ${bids[i + 1]}');
          }
        }

        for (int i = 0; i < asks.length; i += 2) {
          try {
            double price = double.parse(asks[i].toString().replaceAll(',', ''));
            double quantity = double.parse(asks[i + 1].toString().replaceAll(',', ''));
            parsedAsks.add([price, quantity]);
          } catch (e) {
            print('Geçersiz double değeri: ${asks[i]} veya ${asks[i + 1]}');
          }
        }

        return {
          'borsa': 'poloniex',
          'bids': parsedBids,
          'asks': parsedAsks,
        };
      }
    } else {
      return null;
    }
  } catch (error) {
    print('Hata oluştu: $error');
    return null;
  }
}