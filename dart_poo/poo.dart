void main() {
  //instacio o objeto classe dentro de uma var que pode ser um tipo do objeteto craido  no caso um gol é um tipo d eveiculo.
  final gol = veiculo(rodas: 4, modelo: 'Gol', marca: 'fiat', ano: 2015);
  final sandero =
      veiculo(rodas: 4, modelo: 'EkoSport', marca: 'ford', ano: 2019);
  print(
    gol.fullNAme(),
  );
  print(sandero.fullNAme());
}

//crio um objeto com todos seu parametros
class veiculo {
  late int rodas;
  late String modelo;
  late String marca;
  late int ano;

  veiculo(
      {required int rodas,
      required String modelo,
      required String marca,
      required int ano}) {
    this.rodas = rodas;
    this.ano = ano;
    this.marca = marca;
    this.modelo = modelo;
  }

  String fullNAme() {
    return '$marca $modelo $ano';
  }
} /* Dessa forma posso criar objetitos nas lista como pessoas eacessar informações destas pessoa atraves da class*/
