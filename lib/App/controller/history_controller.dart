import 'package:get/get.dart';

class HistoryController extends GetxController {
  final titleHistory = "".obs;
  final bodyHistory = "".obs;
  final fotoHistory = "".obs;

  void setHistory(title, body, foto) {
    titleHistory.value = title;
    bodyHistory.value = body;
    fotoHistory.value = foto;
  }
}
