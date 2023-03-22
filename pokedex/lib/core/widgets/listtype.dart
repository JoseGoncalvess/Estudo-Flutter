// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../services/pokemon_services.dart';

class Listtype extends StatefulWidget {
  const Listtype({
    Key? key,
  }) : super(key: key);

  @override
  State<Listtype> createState() => _ListtypeState();
}

class _ListtypeState extends State<Listtype> {
  List<dynamic> poketipe = [];
  bool leading = true;
  String menssage = '';
  getpoke() {
    setState(() {
      leading = false;
    });
    PokemonServices().getpokemon().then((value) {
      setState(() {
        poketipe = value.list;
        menssage = value.msg;

        setState(() {
          leading = true;
        });
      });
    }).catchError((onError) {
      menssage = "DEU ERRO E FOI ISSO>>> $onError";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: poketipe.length < 1 ? poketipe.length = 1 : poketipe.length,
      itemBuilder: (context, index) {
        return !leading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red[700],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(poketipe[index]),
                ),
              );
      },
    );
  }
}
