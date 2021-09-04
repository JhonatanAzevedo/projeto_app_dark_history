import 'package:get/get.dart';

class HistoryController extends GetxController {
  final titleHistory = "".obs;
  final bodyHistory = "".obs;
  final fotoHistory = "".obs;
  final idHistory = "".obs;

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
  



}




