import 'dart:io';

void main() {
  print('Como se chama ?');
  String? name = stdin.readLineSync();
  print('Qual a sua idade ?');
  String? idade = stdin.readLineSync();
  minhaFucion(int.parse(idade!), name);
}

minhaFucion(int? idade, String? name) {
  print('Tão novo com $idade, Parabéns $name ');
}
