import 'package:application_history_dark/App/data/models/list_model.dart';
import 'package:application_history_dark/App/data/repository/api_repositorie.dart';
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

  final ApiRepositorie apiRepositorie = ApiRepositorie();

 // funaçao de limpa historia
  void clearHistory(){
    titleHistory.value = "";
    bodyHistory.value = "";
    fotoHistory.value = "";
    idHistory.value = "";
  }

//ela vai chamar a fetchApi
void getList() async{
   final response = await apiRepositorie.fetchApi();
   listHistory.assignAll(response);
}

void addList(String title, String body, String foto) async{
   await apiRepositorie.addList(title, body, foto);
   getList();
}

void editList(String title, String body, String id, String foto) async{
   await apiRepositorie.editList(title, body, id, foto);
   getList();
}

void deletList(String id) async{
   await apiRepositorie.deletList(id);
   getList();
   
}


// set history
  void setBody(body) {
    
    bodyHistory.value = body;
  }

//set o title
   void setTitle(title) {
    
    titleHistory.value = title;
  }

// set foto
  void setFoto(foto){
    fotoHistory.value = foto;

  }
  



}




