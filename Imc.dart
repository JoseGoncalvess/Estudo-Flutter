main() {
  //DADOS O CABA
  double autura = 1.81;
  double peso = 87;
//CONTINHA COM SO DADOS
  double imc = peso / (autura * autura);

  ///EFETUANDO A CONDIÇÃO DO VALOR, PARA EXIBIR UMA INTERAÇÃO!
  if (imc < 18.5) {
    print('Seu IMC atual é $imc, é considerado abaixo do peso');
  } else if (imc > 18.5 || imc < 25.9) {
    print('Seu IMC atual é $imc, é considerado Peso Normal');
  } else if (imc > 25 || imc < 29) {
    print('Seu IMC atual é $imc, é considerado Sobrepeso');
  } else if (imc > 30 || imc < 34.5) {
    print('Seu IMC atual é $imc, é considerado Obesidade Grau 1');
  } else if (imc > 35 || imc < 39.9) {
    print('Seu IMC atual é $imc, é considerado Obesidade Grau 2');
  } else if (imc > 40) {
    print('Seu IMC atual é $imc, é considerado Obesidade Grau 3');
  } else {
    print('Verifique se você Inserius os Dados corretamente!');
  }
}
