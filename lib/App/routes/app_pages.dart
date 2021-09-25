import 'package:application_history_dark/App/bindings/history_bindings.dart';
import 'package:application_history_dark/App/ui/android/add_history/add_historys.dart';
import 'package:application_history_dark/App/ui/android/home/home_page.dart';
import 'package:application_history_dark/App/ui/android/list_history/list_history.dart';
import 'package:application_history_dark/App/ui/android/show_history/show_history.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

part './app_routes.dart';

class AppPages {

  static final  routes = [
    GetPage(name: Routes.HOME, page: ()=> HomePage(), binding: HistoryBindings()),
    GetPage(name: Routes.LIST, page: ()=> AsHistory(),),
    GetPage(name: Routes.SHOW_HISTORY, page: ()=> ShowHistory()),
    GetPage(name: Routes.ADD_HISTORY, page: ()=> AddHistory() )
    
  ];
  
}