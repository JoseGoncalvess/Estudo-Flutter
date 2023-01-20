import 'dart:io';

void main(L) {
  bool isRuning = true;
  List<String> produtos = [];

  print("\x1B[2J\x1B[0;0H");
  print('OS comandos são [ADD e IMPRIMIR]');
  print('\n');
  print('O que deseja fazer ?');
  while (isRuning) {
    print('A lista de compras possui ${produtos.length}');
    var comando = stdin.readLineSync();
    if (comando == 'add') {
      print('=== Qual Produto deseja Adcionar? ===');
      var produto = stdin.readLineSync();
      produtos.add(produto!);
    } else if (comando == 'imprimir') {
      print("\x1B[2J\x1B[0;0H");
      print('===Todos os pordutos cadastrados===');

      for (var i = 0; i < produtos.length; i++) {
        print(produtos[i]);
      }
    } else {
      isRuning = false;
      print("\x1B[2J\x1B[0;0Hcls");
      print('fIM DO PROGRAMA');
    }
  }
}
