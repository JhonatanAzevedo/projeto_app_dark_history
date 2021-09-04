import 'package:application_history_dark/App/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:google_fonts/google_fonts.dart';

class AddHistory extends StatefulWidget {
  @override
  _AddHistoryState createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {


  @override
  Widget build(BuildContext context) {
    final history =
        Get.Get.put(HistoryController()); // armazena minha class controladora
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.grey[900],
          title: history.idHistory.value == ""
              ? Text(
                  'Adicionar uma História',
                  style: GoogleFonts.eater(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                )
              : Text(
                  "Editar História",
                  style: GoogleFonts.eater(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
          actions: <Widget>[
            //BUTTON SALVE Historia
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final title = history.titleHistory.value;
                final body = history.bodyHistory.value;

                if (history.idHistory.value == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Historia adicionada')));
                   history.addList(title, body);
                } else {
                  final id = history.idHistory.value;

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Historia editada')));
                  history.editList(title, body, id);
                }


                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[400],
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                initialValue: history.titleHistory.value,
                decoration: InputDecoration(
                  hintText: "Titulo da História",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                ),
                onChanged: (title) {
                  history.setTitle(title);
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                initialValue: history.bodyHistory.value,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "escreva sua história",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    )),
                maxLines: 6,
                onChanged: (body) {
                  history.setBody(body);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
