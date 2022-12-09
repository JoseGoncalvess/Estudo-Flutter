import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: Column(children: [
                          TextField(
                            onChanged: (text) => () {
                              email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder()),
                          ),
                          Container(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (text) => () {
                              password = text;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder()),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              onPressed: () {
                                if (email == "" && password == "") {
                                  Navigator.of(context)
                                      .pushReplacementNamed("/home");
                                } else {}
                              },
                              child: const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  selectionColor: Colors.white,
                                ),
                              ))
                        ]),
                      ),
                    ),
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
          child: Image.network(
              'https://img.freepik.com/free-photo/grunge-paint-background_1409-1337.jpg?w=2000',
              fit: BoxFit.cover),
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        _body()
      ],
    ));
  }
}
