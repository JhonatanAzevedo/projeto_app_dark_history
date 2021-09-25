import 'package:application_history_dark/App/data/models/list_model.dart';
import 'package:dio/dio.dart';

class Api {

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
  Future<RespModel> addHistorys(String title, String body, String foto) async {
    final dio = Dio();
    try {
      var response = await dio
          .post("https://still-hollows-82868.herokuapp.com/filme/add", data: {
        "nome": title,
        "descricao": body,
        "foto": foto,
        "elenco": "-",
      });

      return RespModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

//EDITAR HISTÓRIA
  Future<RespModel> editHistory(String title, String body, String id, String foto) async {
    final dio = Dio();
    try {
      var response = await dio
          .patch("https://still-hollows-82868.herokuapp.com/filme/edit", data: {
        "id": id,
        "nome": title,
        "descricao": body,
        "foto": foto,
        "elenco": "-",
      });
      return RespModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
  
}