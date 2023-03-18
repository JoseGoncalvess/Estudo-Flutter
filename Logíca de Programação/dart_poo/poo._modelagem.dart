import '../Imc_fatored.dart';

void main() {
  final jose = pessoa(nome: 'Gonçlaves', peso: 87.0, altura: 1.81);

  print(jose..calcIMC());
}

//Crio uma objeto pessoa com todas as suas propriedades.
class pessoa {
  final String nome;
  final double peso;
  final double altura;

  pessoa({required this.nome, required this.peso, required this.altura});

  calcIMC() {
    return peso / (altura * altura);
  }
}
