import 'dart:convert';
import 'package:http/http.dart' as http;

//Uma requisição a api
Future main() async {
  //CHAMO A FUNÇÃO QUE ESPERA ALGO
  final json = await fetch();
  //PRINTO O MAP PUXANDO UM CARACTERE [ID]
  print('Quem é esse pókemon...?');
  Future.delayed(Duration(seconds: 3))
      .then((value) => print('E oooo ${json['name']} '));

  //CONVERTE O OBJETO EM UM DJON STRING
  //print(jsonEncode(json));
}

//FAÇO A REQUISIÇÃO DA API
Future fetch() async {
  //PASSO A APEI EM PEDAÇÕS NÃO ENTENDI O PQ AMS PEDE DESSA FORMA
  var url = Uri.https('pokeapi.co', '/api/v2/pokemon/1');
  //ESPERO A REQUISIÇÃO
  var response = await http.get(url);
  //TRANSFORMO O AQUIVO  objet JSON
  var json = jsonDecode(response.body);
  return json;
}
