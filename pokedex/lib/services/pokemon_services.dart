import 'package:dio/dio.dart';
import 'package:pokedexx/model/pokeModel.dart';
import 'package:pokedexx/services/pokedex_interface.dart.dart';

class PokemonServices extends PokedexInterface {
  @override
  Future<ReturnApiList> getpokemon() async {
    List<PokeModel> list = [];
    final dio = Dio();
    // String PokeImg =
    //     "https://github.com/PokeAPI/sprites/blob/master/sprites/pokemon/versions/generation-iv/platinum/1.png";
    String pokeUrl =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    var response = await dio.get(pokeUrl);

    if (response.statusCode == 200) {
      list = response.data;

      // list = List<PokeModel>.from(map.map((e) => PokeModel.fromJson(e)));
    }

    return ReturnApiList(list: list, msg: 'opa opa');
  }
}
