import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedexx/model/pokeModel.dart';
import 'package:pokedexx/services/pokedex_interface.dart.dart';

class PokemonServices extends PokedexInterface {
  @override
  Future<ReturnApiList> getpokemon() async {
    final dio = Dio();
    List<Pokemon> list = [];
    String pokeUrl =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

    var response = await dio.get(pokeUrl);

    if (response.statusCode == 200) {
      //transformo o json que retonrou da api em um formato json que é um map 'as"
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      //passo para aminha lista esse json passando a chave 'pokemon' pra ter acesso a lista
      final listpoke = json['pokemon'] as List<dynamic>;
      list = listpoke.map((e) => Pokemon.fromJson(e)).toList();
    }

    return ReturnApiList(list: list, msg: 'Não obtive os dados');
  }
}

// String PokeImg =
//     "https://github.com/PokeAPI/sprites/blob/master/sprites/pokemon/versions/generation-iv/platinum/1.png";
