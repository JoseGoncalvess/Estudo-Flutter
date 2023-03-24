// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/widgets/listtype.dart';

class Detailpoker extends StatefulWidget {
  const Detailpoker({
    Key? key,
    required this.name,
    required this.type,
    required this.id,
    required this.img,
  }) : super(key: key);
  final String name;
  final List type;
  final String id;
  final String img;

  @override
  State<StatefulWidget> createState() {
    return _DetailpokerState();
  }
}

class _DetailpokerState extends State<Detailpoker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: Backgroud().GetBackgroudColor(type: widget.type[0])),
                child: Stack(
                  children: [
                    Positioned(
                        left: 5,
                        bottom: 200,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Opacity(
                                opacity: 0.13,
                                child: Text(
                                  widget.name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.15,
                                    color: Colors.white,
                                    fontFamily: 'Goldendragon',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 15,
                        left: 300,
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            'assets/img/bolhas.png',
                            scale: 1.8,
                          ),
                        )),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 25,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.img == ''
                                    ? Image.asset(
                                        'assets/img/pokeLoad.gif',
                                        scale: 0.5,
                                      )
                                    : Image.network(
                                        widget.img,
                                        scale: 0.5,
                                      ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(widget.name.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'BebasNEue',
                                            color: Colors.white)),
                                    SizedBox(
                                      child: Column(
                                        children: widget.type
                                            .map((e) => Listtype(pokemon: e))
                                            .toList(),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('STATUS',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white)),
                              Text('EVOLUÇÕES',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Nunito',
                                      color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: Colors.red,
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
