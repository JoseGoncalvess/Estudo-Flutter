import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedexx/core/widgets/pokemoncard.dart';
import 'package:pokedexx/model/pokeModel.dart';
import 'package:pokedexx/model/pokemon_model_v2.dart';
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

  @override
  Future<ReturnApiList> gettypepokemoninfo(int id) async {
    final dio = Dio();
    List<PokemonV2> list = [];

    String baseUrl = 'https://pokeapi.co/api/v2/pokemon/${id}';

    var response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final listAll = json['pokemon'] as List<dynamic>;
      list = listAll.map((e) => PokemonV2.fromJson(e)).toList();
    }

    return ReturnApiList(list: list, msg: 'oloko');
  }
}

// String PokeImg =
//     https://www.serebii.net/pokemongo/pokemon/${widget.id}.png";
