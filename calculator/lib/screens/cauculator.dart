import 'package:calculator/components/display.dart';
import 'package:calculator/components/models/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:calculator/components/display.dart';
import '../components/keyboard.dart';
import '../components/models/memory.dart';

class cauculator extends StatefulWidget {
  @override
  State<cauculator> createState() => _cauculatorState();
}

class _cauculatorState extends State<cauculator> {
  final Memory memory = Memory();

  onPressed(String comand) {
    setState(() {
      memory.applyComand(comand);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [Display(memory.value), Keyboard(onPressed)]),
    );
  }
}
