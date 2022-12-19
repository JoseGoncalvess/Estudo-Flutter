/// Criação d elist view com construtor de listviwer.
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        shadowColor: Colors.black,
        title: const Text("Colunm and Rows"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.start,

          //tem que ter um var numero(na epoca crieiuma lista de nomes com esse titulo)
          //itemCount: numer.length,
          itemBuilder: (context, index) {
            //uso os nomes puxando o index para  adicionar em  nas lista.

            //final name = numer[index];
            return ListTile(title: Text("name"));
          },
        ),
      ),
    );
  }
}
