import 'package:flutter/material.dart';
import 'package:flutter_application_conter_fluterando/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/4/48/EBay_logo.png'),
                    ),
                    Container(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) => () {
                        email = text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email", border: OutlineInputBorder()),
                    ),
                    Container(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) => () {
                        password = text;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", border: OutlineInputBorder()),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (email == "" && password == "") {
                            Navigator.of(context).pushReplacementNamed("/home");
                          } else {
                            print("falhou");
                          }
                        },
                        child: Text("Login"))
                  ]),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/backgrous.jpg', fit: BoxFit.cover),
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        _body()
      ],
    ));
  }
}
