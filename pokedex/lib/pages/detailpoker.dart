import 'package:flutter/material.dart';

class Detailpoker extends StatelessWidget {
  const Detailpoker({super.key, required this.name});
  final int name;
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
                decoration: const BoxDecoration(
                  color: Colors.purple,
                ),
                child: Column(
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
