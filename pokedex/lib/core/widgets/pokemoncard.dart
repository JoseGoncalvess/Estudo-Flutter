// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/model/pokeModel.dart';

class Pokemoncard extends StatefulWidget {
  const Pokemoncard({
    Key? key,
    required this.name,
    required this.type,
    required this.id,
    required this.img,
  }) : super(key: key);

  @override
  State<Pokemoncard> createState() => _PokemoncardState();
  final String name;
  final List type;
  final String id;
  final String img;
}

class _PokemoncardState extends State<Pokemoncard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Backgroud().GetBackgroudColor(type: widget.type[0].toString()),
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.id,
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.name,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.type[0].toString(),
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.img, scale: 0.4)),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
