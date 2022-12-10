import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              Image(
                image: const AssetImage("assets/logo.png"),
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 55,
                          child: DropdownButton(
                              isExpanded: true,
                              underline: Container(
                                height: 1,
                                color: Colors.red,
                              ),
                              items: const [
                                DropdownMenuItem(child: Text('Real')),
                                DropdownMenuItem(child: Text('Dolar'))
                              ],
                              onChanged: (value) {}),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Converter Agora"))
            ],
          ),
        ),
      ),
    );
  }
}
