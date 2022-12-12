import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromARGB(248, 48, 48, 47);
  static const DEFAULT = Color.fromARGB(110, 240, 240, 238);
  static const OPERATION = Color.fromARGB(249, 220, 105, 5);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;

  const Button(
      {super.key,
      required this.text,
      this.big = false,
      this.color = DEFAULT,
      required this.cb});
  const Button.big(
      {super.key,
      required this.text,
      this.big = true,
      this.color = DEFAULT,
      required this.cb});
  const Button.operation(
      {super.key,
      required this.text,
      this.big = false,
      this.color = OPERATION,
      required this.cb});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: big ? 2 : 1,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: () => cb(text),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w200),
            )));
  }
}
