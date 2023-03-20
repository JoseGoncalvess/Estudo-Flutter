import 'package:pokedexx/model/pokeModel.dart';

abstract class PokedexInterface {
  Future<ReturnApiList> getpokemon();
}

class ReturnApiList {
  final List<PokeModel> list;
  final String msg;

  ReturnApiList({required this.list, required this.msg});
}
