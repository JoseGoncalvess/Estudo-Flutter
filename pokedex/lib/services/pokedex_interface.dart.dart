import 'package:pokedexx/model/pokeModel.dart';

abstract class PokedexInterface {
  //metodo que pegar todos os pokemon
  Future<ReturnApiList> getpokemon();
}

class ReturnApiList {
  // recebo uma lsita do tipo do meu modelo
  final List<Pokemon> list;
  //menssagem em caso de erro
  final String msg;

  ReturnApiList({required this.list, required this.msg});
}
