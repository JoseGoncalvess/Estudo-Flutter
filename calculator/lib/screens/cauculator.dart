import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class cauculator extends StatelessWidget {
  const cauculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [Text('Display'), Text('Teclado')]),
    );
  }
}
