
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:google_fonts/google_fonts.dart';

import 'controller/history_controller.dart';

class ShowHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final history = Get.Get.put(HistoryController());


    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Dark Historys',
            style: GoogleFonts.eater(
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            //Titulo do Texto
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "${history.titleHistory.value}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Corpo do Texto
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "${history.bodyHistory.value}",
                  style: GoogleFonts.marvel(
                    textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
