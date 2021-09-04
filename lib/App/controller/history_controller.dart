import 'package:application_history_dark/App/models/list_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final titleHistory = "".obs;
  final bodyHistory = "".obs;
  final fotoHistory = "".obs;
  final idHistory = "".obs;
  final listHistory = <HistoryModel>[].obs;

  void setHistory(title, body, foto, id) {
    titleHistory.value = title;
    bodyHistory.value = body;
    fotoHistory.value = foto;
    idHistory.value = id;
  }

// set history
  void setBody(body) {
    
    bodyHistory.value = body;
  }

//set o title
   void setTitle(title) {
    
    titleHistory.value = title;
  }

  void clearHistory(){
    titleHistory.value = "";
    bodyHistory.value = "";
    fotoHistory.value = "";
    idHistory.value = "";
  }

//ela vai chamar a fetchApi
void getList() async{
   final response = await fetchApi();
   listHistory.assignAll(response);
}

void addList(String title, String body) async{
   await addHistorys(title, body);
   getList();
}

void editList(String title, String body, String id) async{
   await editHistory(title, body, id);
   getList();
}

void deletList(String id) async{
   await deletarHistory(id);
   getList();
   
}







  //funçao de pegar da API
  Future<List<HistoryModel>> fetchApi() async {
    final dio = Dio();
    try {
      var response = await dio.get('https://still-hollows-82868.herokuapp.com/filmes');
      return (response.data as List)
          .map((item) => HistoryModel.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception("erro ao carregar as Historias");
    }
  }

   //funçao de deletar da API
  Future<RespModel> deletarHistory(String id) async {
    final dio = Dio();
    try {
      var response = await dio.delete(
          'https://still-hollows-82868.herokuapp.com/filme/delete',
          data: {
            "id": id,
          });
      return RespModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // ADICIONAR HISTÓRIA
  Future<RespModel> addHistorys(String title, String body) async {
    final dio = Dio();
    try {
      var response = await dio
          .post("https://still-hollows-82868.herokuapp.com/filme/add", data: {
        "nome": title,
        "descricao": body,
        "foto":
            "https://cdn.pixabay.com/photo/2021/08/19/07/16/woman-6557258_960_720.png",
        "elenco": "-",
      });

      return RespModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

//EDITAR HISTÓRIA
  Future<RespModel> editHistory(String title, String body, String id) async {
    final dio = Dio();
    try {
      var response = await dio
          .patch("https://still-hollows-82868.herokuapp.com/filme/edit", data: {
        "id": id,
        "nome": title,
        "descricao": body,
        "foto":
            "https://cdn.pixabay.com/photo/2021/08/19/07/16/woman-6557258_960_720.png",
        "elenco": "-",
      });
      return RespModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  



}




