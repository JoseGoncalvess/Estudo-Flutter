class CalcImc {
  static String msg = '';
  static String imcRes = '';
  String calcImc(altura, peso) {
    double imc = peso / (altura * altura);

    if (imc <= 18.5) {
      msg = 'Cuidado seu peso esta muita abaixo';
      imcRes = imc.toStringAsFixed(1);
    } else if (imc >= 18.5 && imc < 24.9) {
      msg = 'Parabéns Você esta no Peso Ideal';
      imcRes = imc.toStringAsFixed(1);
    } else if (imc > 25 && imc < 29.9) {
      msg = 'opá, Você está levimente acima do Peso';
      imcRes = imc.toStringAsFixed(1);
    } else if (imc > 30 && imc < 34.9) {
      msg = 'Cuidado você esta em obesidade grau 1';
      imcRes = imc.toStringAsFixed(1);
    } else if (imc > 35 && imc < 39.9) {
      msg = 'Cuidado você esta em obesidade grau 2';
      imcRes = imc.toStringAsFixed(1);
    } else if (imc > 40) {
      msg = 'Cuidado você esta em obesidade grau 3';
      imcRes = imc.toStringAsFixed(1);
    }
    return msg;
  }
}
