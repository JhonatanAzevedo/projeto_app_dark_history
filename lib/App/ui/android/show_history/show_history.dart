import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/history_controller.dart';

class ShowHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width / 100;
  final height = MediaQuery.of(context).size.height / 100;
  final history = Get.Get.put(HistoryController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Dark Historys',
          style: GoogleFonts.eater(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: ListView(
          children: 
            [Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Container(
                    height: height * 50,
                    child: Image.network("${history.fotoHistory.value}",
                        fit: BoxFit.fill),
                  ),
                ),
        
                //TITULO DA HISTORIA
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${history.titleHistory.value}",
                      style: GoogleFonts.eater(
                        textStyle: TextStyle(color: Colors.red[800], fontSize: 20),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        
                // CORPO DA HISTORIA
                Padding(
                  padding: const EdgeInsets.only(top:10, bottom: 10, left: 15, right: 15),
                  child: Text("${history.bodyHistory.value}",
                      style: GoogleFonts.smythe(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 27,
                            fontStyle: FontStyle.italic),
                      ),
                      textAlign: TextAlign.justify),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
