import 'package:calculator/components/button.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;
  ButtonRow(this.buttons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: buttons.fold(<Widget>[], (list, b) {
            list.isNotEmpty
                ? list.add(b)
                : list.addAll([
                    const SizedBox(
                      width: 10,
                    ),
                    b
                  ]);
            return list;
          })),
    );
  }
}
