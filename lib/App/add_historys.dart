import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddHistory extends StatelessWidget {
  const AddHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
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
      ),
    );
  }
}
