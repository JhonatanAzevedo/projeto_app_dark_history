import 'package:application_history_dark/App/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:google_fonts/google_fonts.dart';

class AddHistory extends StatefulWidget {
  @override
  _AddHistoryState createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {
  final formkey = GlobalKey<FormState>();
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
                  'Adicione sua História',
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
                final foto = history.fotoHistory.value;

                if (formkey.currentState?.validate() == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Por favor complete os campos!')));
                } else {
                  if (history.idHistory.value == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Historia adicionada')));
                    history.addList(title, body, foto);
                  } else {
                    final id = history.idHistory.value;

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Historia editada')));
                    history.editList(title, body, id, foto);
                  }
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[400],
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  // TITULO DA HISTORIA QUANDO ADICIONAR
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "esse campo nao pode ser nulo";
                      }
                    },
                    initialValue: history.titleHistory.value,
                    decoration: InputDecoration(
                      labelText: "Titulo da História",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                    ),
                    onChanged: (title) {
                      history.setTitle(title);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // CORPO DA HISTORIA QUANDO ADICIONAR
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "esse campo nao pode ser nulo";
                      }
                    },
                    initialValue: history.bodyHistory.value,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: "escreva sua história",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        )),
                    maxLines: 15,
                    onChanged: (body) {
                      history.setBody(body);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // IMAGEM DA HISTORIA QUANDO ADICIONAR
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "esse campo nao pode ser nulo";
                      }
                    },
                    initialValue: history.fotoHistory.value,
                    decoration: InputDecoration(
                      labelText: "coloque a Url da sua imagem",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onChanged: (foto) {
                      history.setFoto(foto);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
