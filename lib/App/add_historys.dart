import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/list_model.dart';

class AddHistory extends StatefulWidget {
  @override
  _AddHistoryState createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController corpoController = TextEditingController();

  Future<RespModel> addHistorys(
    String nome,
    String descricao,
  ) async {
    final dio = Dio();
    try {
      Response response = await dio
          .post("https://still-hollows-82868.herokuapp.com/filme/add", data: {
        "nome": nome,
        "descricao": descricao,
        "foto":
            "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b7c38e83-4208-43a2-b29c-8c8927839554/d6t72g7-9d04b6c1-0367-408e-9c8c-fa3df60a98f2.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2I3YzM4ZTgzLTQyMDgtNDNhMi1iMjljLThjODkyNzgzOTU1NFwvZDZ0NzJnNy05ZDA0YjZjMS0wMzY3LTQwOGUtOWM4Yy1mYTNkZjYwYTk4ZjIuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.f8fpJ8YhIWKLbSo_ZuYaKyUJ8g1L7rT5HDXOjXgc2Gk",
        "elenco": "-",
      });

      return RespModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[400],
        padding: EdgeInsets.all(10),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: "Titulo da História",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black))),
              controller: tituloController,
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: "escreva sua história",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  )),
              maxLines: 4,
              controller: corpoController,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  final titulo = tituloController.text;
                  final corpo = corpoController.text;
                  await addHistorys(titulo, corpo);
                  Navigator.of(context).pushNamed('/list');
                },
                child: Text(
                  "Postar História",
                  style: GoogleFonts.eater(
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.red[500],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
