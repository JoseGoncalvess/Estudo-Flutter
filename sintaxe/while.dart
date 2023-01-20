void main() {
  int contador = 0;
  bool condicao = true;
  while (condicao) {
    if (contador < 150) {
      print('OI, contei $contador!');
    } else {
      condicao = false;
    }
    contador++;
  }
}
