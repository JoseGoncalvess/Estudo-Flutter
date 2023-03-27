import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokemon_model_v2.dart';
import 'package:pokedexx/services/pokemon_services.dart';

class PageTeste extends StatefulWidget {
  const PageTeste({
    super.key,
  });

  @override
  State<PageTeste> createState() => _PageTesteState();
}

class _PageTesteState extends State<PageTeste> {
  List<Stat> pokemonlist = [];
  String erroMensseger = '';

  getpokeinfo() {
    PokemonServices().gettypepokemoninfo(1).then((value) {
      setState(() {
        pokemonlist = value.list as List<Stat>;
      });
    }).catchError((onError) {
      setState(() {
        erroMensseger = 'Deu erro aqui $onError';
      });
    });
    log(erroMensseger);
  }

  @override
  void initState() {
    getpokeinfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('teste'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Text(pokemonlist[1].stat.name == ''
                ? 'vaziu'
                : pokemonlist.toString()),
            Container(child: Text(erroMensseger))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        getpokeinfo();
      }),
    );
  }
}
