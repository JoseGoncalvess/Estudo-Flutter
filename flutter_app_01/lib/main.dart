import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demoo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final numer = [
    'Anny',
    "Gui",
    "Maria",
    "Maykon",
    "Gonçalves",
    "Thiago",
    "Pamela",
    "Ana Liz",
    'Seu Assis',
    'Mãe',
    'Tio',
    'Ravena',
    'Xanin',
    '15',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];
  final list = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          shadowColor: Colors.black,
          title: const Text("Stak"),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/bk.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 80,
                width: 80,
                color: Colors.green,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.amber,
              ),
            ],
          ),
        ));
  }
}
