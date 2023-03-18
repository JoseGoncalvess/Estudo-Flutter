import 'dart:ffi';

void main() {
  final jose = pessoa(nome: 'Gonçlaves', peso: 87.0, altura: 1.81);

  print(jose..calcIMC());

  // mostrando um medico
  final anny = profEd(crm: 8956287, nome: "Anny", altura: 1.50, peso: 65);
  print(anny.crm);
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

//herança da classe pessoa e aporveito o que ja criei  la em pessoa e recrio o medico que também e uma pessoa
class profEd extends pessoa {
  final int crm;

  profEd(
      {required this.crm,
      required String nome,
      required double altura,
      required double peso})
      : super(nome: nome, altura: altura, peso: peso);
}
