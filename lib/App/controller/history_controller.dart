import 'package:get/get.dart';

class HistoryController extends GetxController {
  final titleHistory = "".obs;
  final bodyHistory = "".obs;

  void setHistory(title, body){
    titleHistory.value = title;
    bodyHistory.value = body;
  }

  
}