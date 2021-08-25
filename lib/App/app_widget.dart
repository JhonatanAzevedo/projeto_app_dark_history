import 'package:application_history_dark/App/home_page.dart';
import 'package:application_history_dark/App/list_history.dart';
import 'package:application_history_dark/App/show_history.dart';
import 'package:flutter/material.dart';

class Appwidget extends StatelessWidget {
  const Appwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Colors.grey[800]),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/list': (context) => AsHistory(),
        '/historys': (context) => ShowHistory(),
      },
    );
  }
}