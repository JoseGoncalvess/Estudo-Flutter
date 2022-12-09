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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image(
                  image: NetworkImage(
                      "https://store.playstation.com/store/api/chihiro/00_09_000/container/FR/fr/19/EP2402-CUSA05624_00-AV00000000000228/image?w=320&h=320&bg_color=000000&opacity=100&_version=00_09_000"),
                ),
              ),
              accountName: Text("Gonçalves"),
              accountEmail: Text("joseinacio774@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              subtitle: Text("pagina inicial"),
            ),
            Container(
              height: 440,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Lougt"),
              subtitle: Text("Confira as Ofertas"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.red,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "ATIVE O MODO DARCK!",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
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
                color: Color.fromARGB(255, 0, 1, 2),
              ),
              Container(
                width: 50,
                height: 50,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Container(
                width: 50,
                height: 50,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
          Container(
            height: 20,
          ),
          Text("JA FORAM $conter TOQUES NA TELA!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 88, 89, 90))),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
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
