import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../components/button_Row.dart';
import '../components/button.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  Keyboard(this.cb, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button.big(
              text: 'AC',
              color: Button.DARK,
              cb: cb,
            ),
            Button(text: '%', color: Button.DARK, cb: cb),
            Button.operation(text: '/', cb: cb),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button(text: '6', cb: cb),
            Button(text: '5', cb: cb),
            Button(text: '4', cb: cb),
            Button.operation(text: '-', cb: cb)
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button(text: '3', cb: cb),
            Button(text: '2', cb: cb),
            Button(text: '1', cb: cb),
            Button.operation(text: '+', cb: cb)
          ]),
          const SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button.big(text: '0', cb: cb),
            Button(text: '.', cb: cb),
            Button.operation(text: '=', cb: cb)
          ])
        ],
      ),
    );
  }
}
