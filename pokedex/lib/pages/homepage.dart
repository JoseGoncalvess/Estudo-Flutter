import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedexx/core/widgets/pokecardgrid.dart';
import 'package:pokedexx/pages/detailpoker.dart';
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
  String msg = 'VAi aparecer aqui ';
  bool leading = true;
  bool layout = true;

  getpoke() {
    setState(() {
      leading = false;
    });
    PokemonServices().getpokemon().then((value) {
      setState(() {
        allPoker = value.list as List<Pokemon>;
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  layout = !layout;
                });
              },
              icon: const Icon(
                Icons.grid_view_sharp,
                size: 30,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white
            // image: DecorationImage(
            //     image: const AssetImage(
            //       'assets/img/BK.jpg',
            //     ),
            //     colorFilter: ColorFilter.mode(
            //         Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
            //         BlendMode.modulate),
            //     fit: BoxFit.cover),
            ),
        child: !layout
            ? Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: allPoker
                          .map((e) => Pokecardgrid(
                              name: e.name,
                              type: e.type,
                              id: e.id.toString(),
                              img: e.img))
                          .toList(),
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: !leading ? 1 : allPoker.length,
                      itemBuilder: (BuildContext context, int index) {
                        return !leading
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red[700],
                                  ),
                                ),
                              )
                            : Pokemoncard(
                                onPressed: () {},
                                name: allPoker[index].name,
                                type: allPoker[index].type,
                                id: allPoker[index].id.toString(),
                                img: allPoker[index].img);
                      },
                    ),
                  )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Detailpoker(name: 1),
        ));
      }),
    );
  }
}
