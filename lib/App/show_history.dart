import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowHistory extends StatelessWidget {
  const ShowHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "vhashvoasgvogao",
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
                  "sigfsgfogsafgogfo",
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
