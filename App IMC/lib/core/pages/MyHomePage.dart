import 'package:flutter/material.dart';
import 'package:imccalc/core/model/calc_imc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  final _pesokey = GlobalKey<FormState>();
  final _altkey = GlobalKey<FormState>();
  String resultimc = CalcImc.imcRes = '';
  String resultmsg = CalcImc.msg = '';
  String youmsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFBD59),
        title: const Center(
            child: Text(
          'Calculo IMC',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        )),
        actions: [
          IconButton(
              onPressed: () {
                _reflashFull();
              },
              icon: const Icon(
                Icons.refresh_sharp,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/img/ondinha.png',
                ),
                fit: BoxFit.cover,
                alignment: Alignment.center)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.41,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  'Seu peso em (Kg)',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                key: _pesokey,
                                controller: weightController,
                                validator: (value) {
                                  if (value == '') {
                                    return 'Digite o valor';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFFFBD59), width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFFFBD59),
                                        width: 2,
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  'Sua altura em (m)',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                key: _altkey,
                                controller: heightController,
                                validator: (value) {
                                  if (value == '') {
                                    return 'Digite o valor';
                                  } else {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFFFBD59), width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFFFBD59),
                                        width: 2,
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                          onPressed: () {
                            CalcImc().calcImc(
                                double.parse(heightController.text),
                                double.parse(weightController.text));
                            setState(() {
                              youmsg = 'Seu IMC';
                            });
                            heightController.clear();
                            weightController.clear();

                            setState(() {
                              resultimc = CalcImc.imcRes;
                              resultmsg = CalcImc.msg;
                            });
                            if (_validateCaps() == true) {}
                          },
                          child: const Text(
                            'Calcular',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4855,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  youmsg,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  resultimc,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                ),
                                Text(
                                  resultmsg,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _validateCaps() {
    if (_altkey.currentState!.validate() || _pesokey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  _reflashFull() {
    heightController.clear();
    weightController.clear();
    setState(() {
      resultimc = '';
      resultmsg = '';
      youmsg = '';
    });
    //retira o foco dos textfiel
    FocusScope.of(context).unfocus();
  }
}
