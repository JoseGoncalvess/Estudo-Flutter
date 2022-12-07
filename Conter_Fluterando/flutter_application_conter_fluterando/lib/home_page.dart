import 'package:flutter/material.dart';
import 'package:flutter_application_conter_fluterando/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int conter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Já foi $conter na Tela!"),
          Switch(
              value: AppController.instace.isDarkthemeDark,
              onChanged: (value) {
                AppController.instace.changeTheme();
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.blueAccent,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.blueAccent,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.blueAccent,
              )
            ],
          ),
          Container(),
          Switch(
            value: AppController.instace.isDarkthemeDark,
            onChanged: (value) => () {},
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            conter++;
          });
        },
      ),
    );
  }
}
