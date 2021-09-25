import 'package:application_history_dark/App/data/provider/api.dart';

class ApiRepositorie {
  Api api = Api();

  fetchApi() {
    return api.fetchApi();
  }

  addList(String title, String body, String foto) async {
    return api.addHistorys(title, body, foto);
  }

  editList(String title, String body, String id, String foto) {
    return api.editHistory(title, body, id, foto);
  }

  deletList(String id) {
    return api.deletarHistory(id);
  }
}
