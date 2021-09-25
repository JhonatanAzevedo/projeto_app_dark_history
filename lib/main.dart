import 'package:application_history_dark/App/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Appwidget());
  
}



class Appwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Colors.grey[900]),
        ),
         
      ),

      initialRoute: '/',
      getPages: AppPages.routes,
    );
  }
}
