import 'package:currency_convert/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  TextEditingController totext = TextEditingController();
  TextEditingController fromtext = TextEditingController();

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController() {
    toCurrency = CurrencyController().listCurrency[0];
    fromCurrency = CurrencyController().listCurrency[1];
  }

  void convert() {
    String text = totext.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = value * toCurrency.dollar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    }
//sempre coloca tipo monetario
    fromtext.text = returnValue.toStringAsFixed(2);
  }
}
