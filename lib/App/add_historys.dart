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
            "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a6b9cb17-f537-4ec9-9cac-3dcba55f5584/d75j1tf-5ce10b3b-8599-4a28-b252-4df6351d2f2d.jpg/v1/fill/w_1024,h_1375,q_75,strp/terror_by_priestofterror_d75j1tf-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTM3NSIsInBhdGgiOiJcL2ZcL2E2YjljYjE3LWY1MzctNGVjOS05Y2FjLTNkY2JhNTVmNTU4NFwvZDc1ajF0Zi01Y2UxMGIzYi04NTk5LTRhMjgtYjI1Mi00ZGY2MzUxZDJmMmQuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.6JawFvTB--OUW06z0kIvq0tawgno2pMQp3SIVC4HbfU",
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            'Adicionar uma História',
            style: GoogleFonts.eater(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Historia adicionada')));
                final titulo = tituloController.text;
                final corpo = corpoController.text;
                await addHistorys(titulo, corpo);
                Navigator.of(context).pushReplacementNamed('/list');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              maxLines: 6,
              controller: corpoController,
            ),
            // SizedBox(height: 10),
            /*  ElevatedButton(
                onPressed: () async {
                  final titulo = tituloController.text;
                  final corpo = corpoController.text;
                  await addHistorys(titulo, corpo);
                  Navigator.of(context).pushReplacementNamed('/list');
                },
                child: Text(
                  "Postar História",
                  style: GoogleFonts.eater(
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.red[500],
                    ),
                  ),
                )), */
          ],
        ),
      ),
    );
  }
}
