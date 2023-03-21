import 'package:flutter/material.dart';
import '../core/widgets/pokemoncard.dart';
import '../model/pokeModel.dart';
import '../services/pokemon_services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Pokemon> allPoker = [];
  List<Pokemon> alltipe = [];
  String msg = 'VAi aparecer aqui ';
  bool leading = true;

  getpoke() {
    setState(() {
      leading = false;
    });
    PokemonServices().getpokemon().then((value) {
      setState(() {
        allPoker = value.list;
        msg = value.msg;

        setState(() {
          leading = true;
        });
      });
    }).catchError((onError) {
      msg = "DEU ERRO E FOI ISSO>>> $onError";
    });
  }

  @override
  void initState() {
    getpoke();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: const Center(
              child: Text(
            'Pokedex',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: !leading ? 1 : allPoker.length,
                  itemBuilder: (BuildContext context, int index) {
                    return !leading
                        ? Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.red[700],
                              ),
                            ),
                          )
                        : Pokemoncard(
                            name: allPoker[index].name,
                            type: allPoker[index].type,
                            id: allPoker[index].id.toString(),
                            img: allPoker[index].img);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
