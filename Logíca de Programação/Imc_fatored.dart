import 'dart:io';

main() {
  print('bem vindo Ao IMC NA CERTA');
  print('COM VOCe^SE CHAMA?');
  final String name = pegarName();
  print('Prazer em te conhecer $name');

  print('$name, ENSIRA SUE PESO!');
  double pesoString = pegarPeso();

  print('$name, ENSIRA SUA ALTURA!');
  double alturaString = pegarAltura();

  print('cauculando 99%...');
  //DADOS O CABA
  double autura = alturaString;
  double peso = pesoString;
//CONTINHA COM SO DADOS
  double imc = calcIMC(peso: peso, altura: autura);

  ///EFETUANDO A CONDIÇÃO DO VALOR, PARA EXIBIR UMA INTERAÇÃO!
  if (imc < 18.5) {
    print(
        'Seu IMC atual é $imc, Atenção este IMC é considerado abaixo do peso');
  } else if (imc > 18.5 || imc < 25.9) {
    print(
        'Seu IMC atual é $imc, fique tranquilo este IMC considerado Peso Normal');
  } else if (imc > 25 || imc < 29) {
    print('Seu IMC atual é $imc, Opa este IMC é  considerado Sobrepeso');
  } else if (imc > 30 || imc < 34.5) {
    print(
        'Seu IMC atual é $imc, Atenção este IMC é considerado Obesidade Grau 1');
  } else if (imc > 35 || imc < 39.9) {
    print(
        'Seu IMC atual é $imc, Cuidado este IMC é considerado Obesidade Grau 2');
  } else if (imc > 40) {
    print(
        'Seu IMC atual é $imc, Muito cuidado este IMC é considerado Obesidade Grau 3');
  } else {
    print('Verifique se você Inserius os Dados corretamente!');
  }
}

calcIMC({required peso, required altura}) {
  return peso / (altura * altura);
}

String pegarName() {
  final String? name = stdin.readLineSync();
  if (name == null) {
    return 'Anonimo';
  } else {
    return name;
  }
}

pegarPeso() {
  String? pesoString = stdin.readLineSync();
  if (pesoString == null) {
    return 0;
  } else {
    return double.parse(pesoString);
  }
}

pegarAltura() {
  String? alturaString = stdin.readLineSync();
  if (alturaString == null) {
    return 0.0;
  } else {
    return double.parse(alturaString);
  }
}
