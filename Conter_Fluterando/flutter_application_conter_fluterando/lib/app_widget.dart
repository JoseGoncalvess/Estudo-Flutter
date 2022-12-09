import 'package:flutter/material.dart';
import 'package:flutter_application_conter_fluterando/app_controller.dart';

import 'home_page.dart';
import 'login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instace,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.red,
              brightness: AppController.instace.isDarkthemeDark
                  ? Brightness.dark
                  : Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              "/": (context) => const LoginPage(),
              "/home": (context) => const HomePage()
            },
          );
        });
  }
}
