import 'package:flutter/material.dart';
import 'package:shoesshop/screens/spalsh_page.dart';

//COLOR
//AZUL-ESCURO= #41C0F2
//AZUL-CLARO= #70CFF5

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
      home: const SplashPage(),
    );
  }
}
