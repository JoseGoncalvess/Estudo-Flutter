import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokeModel.dart';
import 'package:pokedexx/services/pokemon_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  final String title = 'Pokedex';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pokemon> allPoker = [];
  String msg = 'VAi aparecer aqui ';

  getpoke() {
    PokemonServices().getpokemon().then((value) {
      setState(() {
        allPoker = value.list;
        msg = value.msg;
      });
    }).catchError((onError) {
      msg = "DEU ERRO E FOI ISSO>>> $onError";
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Text(
                msg,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allPoker.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/${allPoker[index].id.toString()}.png'),
                    ),
                    title: Text(allPoker[index].name),
                    subtitle: Text(allPoker[index].height),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    getpoke();
  }
}
