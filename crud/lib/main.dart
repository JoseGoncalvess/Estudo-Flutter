import 'dart:io';

import 'package:crud/models/food_model.dart';
import 'package:flutter/material.dart';

import 'services/crud_services.dart';

void main() {
  //CHAMADA DO CERIFICADO  QUE DA CONFLITO DO DIO
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _counter = "API RETURN";

  List<FoodModel> list = [];

  FoodModel? current;
//CONTROLES
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

//INDICADORES DE ANITATION E MUDANÇA DE ESTADO
  bool loading = false;
  bool isEding = false;

  @override
  //INICIO JA EFETUA O CHAMADO DA API
  void initState() {
    getList();
    super.initState();
  }

  void _incrementCounter() {}
//FUNÇÃO DE DELETAR
  deleteItem(String id) {
    //INDICADOR DE ANIMATION
    setState(() {
      loading = true;
    });
    //CHAMADO DO METODO DE DELETE
    CrudServices().deleteCrud(id).then((value) {
      if (value == true) {
        getList();
      } else {
        _counter = "erro ao apagar a parada";
      }
      setState(() {
        loading = false;
      });
      //MELHOR MANEIRA D ETRATAR O ERRO SEM CRASHAR O APP DOO USER
    }).catchError((onError) {
      _counter = "DEU ERRO E FOI ISSO>>> $onError";
      setState(() {
        loading = false;
      });
    });
  }

//CHAMADO DO  METODO PEGAR UM ITEM
  getItem(String id) {
    CrudServices().getItemCrud("641782d622534003e8c8e854").then((value) {
      if (value != null) {
        setState(() {
          //ATRIBUUO O REOTRNO A VAR
          _counter = value.name;
        });
      } else {
        setState(() {
          _counter = "Item inexistente";
        });
      } //MELHOR MANEIRA D ETRATAR O ERRO SEM CRASHAR O APP DOO USER
    }).catchError((onError) {
      _counter = "DEU ERRO E FOI ISSO>>> $onError";
      setState(() {});
    });
  }

//CHAMDO DA API COMPLETA
  getList() {
    setState(() {
      loading = true;
    });
    CrudServices().getCrud().then((value) {
      setState(() {
        //ATRIBUO OS PARAMETROS DO RETORNO
        list = value.list;
        _counter = value.msg;
      }); //MELHOR MANEIRA D ETRATAR O ERRO SEM CRASHAR O APP DOO USER
    }).catchError((onError) {
      _counter = "DEU ERRO E FOI ISSO>>> $onError";
      setState(() {
        loading = false;
      });
    });
  }

//ADD NEW ITEM
  addItem() {
    //PASSOP OS VALORES ASEREM ATRIBUIDOS
    FoodModel item = FoodModel(
        id: "id", name: _nameController.text, price: _priceController.text);
//COMO NÃO VOU USAR O ID POSSO PASSAR COMO NULO
    CrudServices().postCrud(item).then((value) {
      if (value != null) {
        getList();
      } else {
        _counter = "erro ao adicionar a parada";
      }
      setState(() {
        loading = false;
      }); //MELHOR MANEIRA D ETRATAR O ERRO SEM CRASHAR O APP DOO USER
    }).catchError((onError) {
      _counter = "DEU ERRO E FOI ISSO>>> $onError";
      setState(() {
        loading = false;
      });
    });
//LIMPO OS CAMPOS
    setState(() {
      _nameController.clear();
      _priceController.clear();
    });
  }

//EDITO UM ITEM EXISTENTE
  editItem() {
    //ITEM VAI SER IGUALA O MODELO
    FoodModel item = FoodModel(
        id: "id", name: _nameController.text, price: _priceController.text);

    CrudServices()
        .updateCrud(
            //CURRENTE VAI SER UM FOODMODEL QUE PODE SER VAZIO MAS NÃO VAI SER
            food: current!,
            name: _nameController.text,
            price: _priceController.text)
        .then((value) {
      if (value != true) {
        getList();
      } else {
        _counter = "erro ao Editar a parada";
      }
      setState(() {
        loading = false;
      }); //COMO NÃO VOU USAR O ID POSSO PASSAR COMO NULO
    }).catchError((onError) {
      _counter = "DEU ERRO E FOI ISSO>>> $onError";
      setState(() {
        loading = false;
      });
    });

    setState(() {
      _nameController.clear();
      _priceController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                color: Colors.blue,
                child: Column(
                  children: const [
                    Text("ITEM SELECIONADO: "),
                    Text("Name: "),
                    Text("Price: "),
                  ],
                )),
//CAPTAÇÃO DE INFORMAÇÃO
            TextField(
              controller: _nameController,
            ),
            // SizedBox(height: 8,),
            TextField(
              controller: _priceController,
            ),
//AO IDENTIDICAR SE EDITANDO OU ADD NEW ITEM
            ElevatedButton(
                onPressed: () {
                  if (isEding) {
                    editItem();
                  } else {
                    addItem();
                  }
                },
                //INDICADOR D E AÇÃO DO BUTTOM
                child: Text(isEding ? "Edit Item" : "Add new item")),

            Expanded(
                //ESTRUTURANDO NOSSAS API EM UMA LISTA
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          //
                          leading: IconButton(
                            onPressed: () {
                              //RECEBO OS VALORES DO ITEM EXISTENTE PARA EDITAR
                              setState(() {
                                isEding = !isEding;
                                _nameController.text = list[index].name;
                                _priceController.text = list[index].price;
                                current = list[index];
                              });
                            },
                            icon: Icon(
                              Icons.edit,
                              color: isEding ? Colors.amber : Colors.grey,
                            ),
                          ),
                          title: Center(child: Text(list[index].name)),
                          trailing: IconButton(
                            //AO DELELTAR PASSO O ID DO INTEMD A LISTA
                            onPressed: () => deleteItem(list[index].id),
                            icon: const Icon(Icons.delete),
                          ));
                    }))
          ],
        ),
      ),
      //INDICADOR DE EDIÇÃO OU EXCLUSÃO CASO NÃO SERA APENAS UM ITEM NORMAL
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.get_app_rounded),
      ),
    );
  }
}

//RESOLVENDO O ERRO DE CERTIFICADO DO DIO
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
