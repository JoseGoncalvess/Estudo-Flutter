import 'package:flutter/material.dart';
import 'package:flutter_application_conter_fluterando/app_controller.dart';

class HomePage extends StatefulWidget {
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
        title: Text(
          "Home Page",
        ),
      ),
      body: Center(
        child: Switch(
            value: AppController.instace.isDarkthemeDark,
            onChanged: (value) {
              AppController.instace.changeTheme();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            conter++;
          });
        },
      ),
    );
  }
}
