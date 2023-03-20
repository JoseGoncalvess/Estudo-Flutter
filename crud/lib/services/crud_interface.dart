import 'package:crud/models/food_model.dart';

//MODELO DE CONTRATO ONDE SE ENCONTRA TODOS OOS SERVIÇOS QUE DEVO ULTILIZAR DO MODELO # CRUD #

//DENTRO DA CLASSSE ABSTATA CRIASSE ETODOS FUTUROES QUE  DEFINO O RETORNO DELES EM ALGUNS CASOS POSSO RETORNAR NULL PO MEIO DA "?"
abstract class ICrud {
//METODO GET:  FAÇO O GET DO CRUD POR INTEIRO (API)
  Future<ReturnApiList> getCrud();
  //EFETUO O GET D EUM ITEM ESPECIFICO DA API
  Future<FoodModel?> getItemCrud(String id);
  //EFETUO O POST(ADD NEW ITEM) ADICONO UM NOVO ITEM A (API)
  Future<FoodModel?> postCrud(FoodModel food);
  //ATUALIZA DETERMIAN INFORMAÇÃO DA API, NO CASO UM ITEM POR MEIO DOS PARAMETROS
  Future<bool> updateCrud(
      {required FoodModel food, String? name, String? price});
  //DELETA UM ITEM DA (API) PR MEIO DO IDENTIFICADOR
  Future<bool> deleteCrud(String id);
}

//FORMA DE TRATAR O ERRO  QUE A API POSSA RETORNAR  PASSANDO O QUE ELE RETORNA + MS PARA APSSAR POR USUARIO
// D EESTREMA IMPORTANCIA ESSE TRATAMENTE DE ERRO PRO PARTE DO PROGRAMADOR AS EVZES  O APP FOI OK MAS A API PODE TER DADO ERRO
class ReturnApiList {
  final List<FoodModel> list;
  final String msg;

  ReturnApiList(this.list, this.msg);
}