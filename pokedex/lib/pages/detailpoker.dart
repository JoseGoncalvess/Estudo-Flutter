import 'package:flutter/material.dart';

class Detailpoker extends StatelessWidget {
  const Detailpoker({super.key, required this.name});
  final int name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.purple,
              child: Text(name.toString()),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
