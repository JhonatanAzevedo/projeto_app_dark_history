import 'package:application_history_dark/App/controller/history_controller.dart';
import 'package:application_history_dark/App/views/show_history.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:google_fonts/google_fonts.dart';
import '../models/list_model.dart';
import 'add_historys.dart';

class AsHistory extends StatefulWidget {
  @override
  _AsHistoryState createState() => _AsHistoryState();
}

class _AsHistoryState extends State<AsHistory> {
  final dio = Dio();
//funçao de pegar da API
  Future<List<HistoryModel>> listHistory() async {
    try {
      var response =
          await dio.get('https://still-hollows-82868.herokuapp.com/filmes');
      return (response.data as List)
          .map((item) => HistoryModel.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception("erro ao carregar as Historias");
    }
  }

  //funçao de deletar da API
  Future<RespModel> deletarHistory(String id) async {
    final dio = Dio();
    try {
      Response response = await dio.delete(
          'https://still-hollows-82868.herokuapp.com/filme/delete',
          data: {
            "id": id,
          });
      return RespModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final history = Get.Get.put(HistoryController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
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
      ),
      body: Container(
        /* width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height, */
        color: Colors.black,
        child: FutureBuilder<List>(
            future: listHistory(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro ao carregar Historias',
                      style: TextStyle(color: Colors.red)),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Material(
                        // click na historia para ver ela completa
                        child: Ink(
                          color: Colors.grey[900],
                          child: ListTile(
                            title: Text(
                              snapshot.data![index].nome,
                              style: GoogleFonts.smythe(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),

                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage(snapshot.data![index].foto),
                            ),

                            // EDITAR UMA HISTORIA
                            trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.edit),
                                        color: Colors.green,
                                        onPressed: () {
                                          final foto =
                                              snapshot.data![index].foto;
                                          final titulo =
                                              snapshot.data![index].nome;
                                          final corpo =
                                              snapshot.data![index].descricao;
                                          final id = snapshot.data![index].id;

                                          history.setHistory(
                                              titulo, corpo, foto, id);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddHistory()));
                                        }),

                                    //DELETAR UMA HISTORIA
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      color: Colors.red,
                                      onPressed: (){
                                        
                                        showDialog(context: context, 
                                        builder: (ctx) =>  AlertDialog(
                                          title: Text('Deletar História'),
                                          content: Text("Certeza?"),
                                          actions: <Widget> [
                                            ElevatedButton(
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                               child: Text('Não')),
                                               ElevatedButton(
                                              onPressed: ()async{
                                                final id = snapshot.data![index].id;
                                                await deletarHistory(id);
                                                Navigator.of(context).pop();
                                              },
                                               child: Text('Sim'))
                                          ],
                                        )
                                        );





                                        
                                      },
                                    )
                                  ],
                                )),
                            onTap: () {
                              final foto = snapshot.data![index].foto;
                              final titulo = snapshot.data![index].nome;
                              final corpo = snapshot.data![index].descricao;
                              final id = snapshot.data![index].id;

                              history.setHistory(titulo, corpo, foto, id);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowHistory()));
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              // CIRCULO DE CARREGAR
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }),
      ),

      // BUTTON DE ADICONAR UMA HISTORIA
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        child: Icon(Icons.add),
        onPressed: () {
          history.clearHistory();
          Navigator.of(context).pushNamed('/AddHistory');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
