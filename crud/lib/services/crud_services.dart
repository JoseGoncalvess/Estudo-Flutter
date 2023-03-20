import 'package:crud/models/food_model.dart';
import 'package:crud/services/crud_interface.dart';
import 'package:dio/dio.dart';

//CRIAS-E UMA CLASSE ONDE DE FATO EFETUAREMOS A ESTRUTURA DO CONSSUMO DA (API)
//VAMOS EE=XTEDER ESSA CLASSE DO NOSS CONTRATO ASSIM HERDAMOS SAUS PROPRIEDADES E METODOS

class CrudServices extends ICrud {
  static String test = "";

//ESTANCIAMOS UMA CLIENTE PRA FACILITAR O CHAMADO DO DIO
  final Dio cliet = Dio();
  //CRIAMOS UMA VARIAVEL BASE PARA RQUISIÇÃO
  String url =
      "https://crudcrud.com/api/ebfb13f228984ed59a130cdd6a5fa387/foods";

  @override
  //METODO DELETE NOS RETORNA TRUE OR FALSE AFINAL SO PRECISO SABER SE DEU CERTO A EXCLUSSÃO
  Future<bool> deleteCrud(String id) async {
    // ignore: todo
    //TODO METODO VAI TER UM VAR RESPONSE QUE PRECISA ESPERAR O CHAMADO DA API CLARO PASSADNO OS PARAMETROS SE REQUISITADOS
    var response = await cliet.delete("$url/$id");
// CONDIÇÃO DO RETORNO APAENAS PARA SABER SE DEU CERTO JA QUE RETORNA UM 'BOOL'
    return response.statusCode == 200 ? true : false;
  }

//METODO GET REORNA TODA A API QUE EU SEIQUE E UMA MAP DE MODELO
//NESTE CASO   'ReturnApiList' JUSTAMENTE PRA EFETUAR O TRATAMNENTO  DO POSSIVEL ERRO DÁ API
  @override
  Future<ReturnApiList> getCrud() async {
    //CRIO UMA LISTA VAZIA
    List<FoodModel> list = [];
    //A VAR RESPONSE QUE SEMPRE VAI TER
    var response = await cliet.get(url);
//DEPENDENDO DA RESPOSTA DA REQUISIÇÃO
    if (response.statusCode == 200) {
      //DEFINO QUE O COPO DA API ( response.data) E DO TIPO MAP PARA PDER ACESSAR AS FERRAMENTAS DO MAP.
      List<dynamic> map = response.data;
      //E ATRIBUI A MINHA LISTA O LISTA DO MODELO ONDE TRANSFORMO CADA ITEM EM UM FROMJSON
      list = List<FoodModel>.from(map.map((e) => FoodModel.fromJson(e)));
    }
    //AQUI AQUELE TRATAMENTO DE REPOSTA DA API
    return ReturnApiList(list, response.statusCode == 200 ? "Sucess" : "Erro");
  }

// O METODO GETITEM EFETUO A SOLICITAÇÃOD  EAPENAS UM ITEM POR MEIO DO IDENTIFICADO QUE PASSO COMO PARAMETRO
  @override
  Future<FoodModel?> getItemCrud(String id) async {
    //VAR RESPONSE QUE FAZ  AREQUISIÇÃO
    var response = await cliet.get("$url/$id");
// SE FOR OK PEGAR O ITEM QUE RETORNO E TRANSFORMA EM UM JSON
    return response.statusCode == 200
        ? FoodModel.fromJson(response.data)
        : null;
  }

//EFETUO  ADIÇÃO DE UM NOVO ITEM A NOSSA SERVIDOR PASSADNO OS PARAMETROS DA ESTRUTURA
  @override
  Future<FoodModel?> postCrud(FoodModel food) async {
    //A VAR RESPONSE EFETUANDO A REQUISIÇÃO
    //PASSO A URL E O DATA{PARAMETROS} QUE NESSE CASO E O CORPO DO ITEM
    var response =
        await cliet.post(url, data: {"name": food.name, "price": food.price});

    return response.statusCode == 201
        ? FoodModel.fromJson(response.data)
        : null;
  }

// METODO UPDATE PEGO UM ITEM QUE JA EXISTE E EFETUO A EDIÇÃO DO MESMO  OU DE APENAS UM PARAMETRO
  @override
  //RECEBE UM MODELO E DOIS PARAMETROS QUE PODE SIM SER NULO
  Future<bool> updateCrud(
      {required FoodModel food, String? name, String? price}) async {
    //REQUISIÇÃO POR MEIO DE UMA PARAMETRO NO CASO ID
    var response = await cliet.put("$url/${food.id}",
        data: {"name": name ?? food.name, "price": price ?? food.price});
//SO PRECISO SABER SE DEU CERTO OU ERRO
    return response.statusCode == 200 ? true : false;
  }
}
