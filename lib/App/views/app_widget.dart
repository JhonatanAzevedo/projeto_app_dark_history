import 'package:application_history_dark/App/views/home_page.dart';
import 'package:application_history_dark/App/views/list_history.dart';
import 'package:application_history_dark/App/views/show_history.dart';
import 'package:flutter/material.dart';

import 'add_historys.dart';

class Appwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Colors.grey[900]),
        ),
         
      ),
      
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/list': (context) => AsHistory(),
        '/historys': (context) => ShowHistory(),
        '/AddHistory':(context) => AddHistory(),
      },
    );
  }
}
