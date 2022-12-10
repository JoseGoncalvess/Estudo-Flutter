class CurrencyModel {
  final String name;
  final double real;
  final double dollar;
  final double euro;

  CurrencyModel({
    required this.real,
    required this.dollar,
    required this.euro,
    required this.name,
  });
}

class CurrencyController {
  List<CurrencyModel> listCurrency = [
    CurrencyModel(name: 'Real', real: 1.0, dollar: 0.18, euro: 0.15),
    CurrencyModel(name: 'Dollar', real: 5.65, dollar: 1.0, euro: 0.85),
    CurrencyModel(name: 'Euro', real: 6.62, dollar: 1.17, euro: 1.0),
  ];
}
