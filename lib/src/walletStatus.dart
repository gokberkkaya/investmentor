import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> getAllWalletStatus() async {
  final List<Future<List<Map<String, dynamic>>>> exchangeFutures = [
    getPoloneixDepositAndWithdraw(),
    getMexcDepositAndWithdraw(),
    getKucoinDepositAndWithdraw(),
    getHuobiDepositAndWithdraw(),
    getGateDepositAndWithdraw(),
  ];

  final List<List<Map<String, dynamic>>> exchanges = await Future.wait(exchangeFutures);

  final allDepth = exchanges.expand((element) => element).toList();

  return allDepth;
}



Future<List<Map<String, dynamic>>> getPoloneixDepositAndWithdraw() async {
  try {
    final response = await http.get(Uri.parse('https://api.poloniex.com/currencies'));
    final data = json.decode(response.body);

    List<Map<String, dynamic>> values = [];

    for (final item in data) {
      String currency = item.keys.first;
      bool deposit = item[currency]?['walletDepositState'] == "ENABLED";
      bool withdraw = item[currency]?['walletWithdrawalState'] == "ENABLED";

      values.add({
        'borsa_name': 'poloneix',
        'currency': currency,
        'deposit': deposit,
        'withdraw': withdraw,
      });
    }

    return values;
  } catch (error) {
    // Hata durumlarına karşı başa çıkabilirsiniz.
    throw error;
  }
}



Future<List<Map<String, dynamic>>> getMexcDepositAndWithdraw() async {
  try {
    final response = await http.get(Uri.parse('https://www.mexc.com/open/api/v2/market/coin/list?currency'));
    final data = json.decode(response.body)['data'];

    List<Map<String, dynamic>> values = [];

    for (final coinData in data) {
      String coinName = coinData['currency'];
      bool withdraw = false;
      bool deposit = false;

      for (final coin in coinData['coins']) {
        if (coin['is_withdraw_enabled'] && !withdraw) {
          withdraw = true;
        }

        if (coin['is_deposit_enabled'] && !deposit) {
          deposit = true;
        }
      }

      values.add({
        'borsa_name': 'mexc',
        'currency': coinName,
        'deposit': deposit,
        'withdraw': withdraw,
      });
    }

    return values;
  } catch (error) {
    // Hata durumlarına karşı başa çıkabilirsiniz.
    throw error;
  }
}


Future<List<Map<String, dynamic>>> getKucoinDepositAndWithdraw() async {
  try {
    final response = await http.get(Uri.parse('https://api.kucoin.com/api/v1/currencies'));
    final data = json.decode(response.body)['data'];

    List<Map<String, dynamic>> values = [];

    for (final item in data) {
      values.add({
        'borsa_name': 'kucoin',
        'currency': item['currency'],
        'deposit': item['isDepositEnabled'],
        'withdraw': item['isWithdrawEnabled'],
      });
    }

    return values;
  } catch (error) {
    // Hata durumlarına karşı başa çıkabilirsiniz.
    throw error;
  }
}


Future<List<Map<String, dynamic>>> getHuobiDepositAndWithdraw() async {
  try {
    final response = await http.get(Uri.parse('https://api.huobi.pro/v2/reference/currencies'));
    final data = json.decode(response.body)['data'];

    List<Map<String, dynamic>> values = [];

    for (final item in data) {
      bool deposit = false;
      bool withdraw = false;

      for (final chain in item['chains']) {
        if (chain['depositStatus'] == 'allowed') {
          deposit = true;
        }
        if (chain['withdrawStatus'] == 'allowed') {
          withdraw = true;
        }
      }

      values.add({
        'borsa_name': 'huobi',
        'currency': item['currency'],
        'deposit': deposit,
        'withdraw': withdraw,
      });
    }

    return values;
  } catch (error) {
    // Hata durumlarına karşı başa çıkabilirsiniz.
    throw error;
  }
}



Future<List<Map<String, dynamic>>> getGateDepositAndWithdraw() async {
  try {
    final response = await http.get(Uri.parse('https://api.gateio.ws/api/v4/spot/currencies/'));
    final data = json.decode(response.body);

    List<Map<String, dynamic>> values = [];

    for (int i = 0; i < data.length; i++) {
      values.add({
        'borsa_name': 'gate',
        'currency': data[i]['currency'],
        'deposit': !data[i]['deposit_disabled'],
        'withdraw': !data[i]['withdraw_disabled'],
      });
    }

    return values;
  } catch (error) {
    // Hata durumlarına karşı başa çıkabilirsiniz.
    throw error;
  }
}
