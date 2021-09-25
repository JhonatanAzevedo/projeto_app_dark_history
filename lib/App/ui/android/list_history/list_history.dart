import 'package:application_history_dark/App/controller/history_controller.dart';
import 'package:application_history_dark/App/ui/android/show_history/show_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:google_fonts/google_fonts.dart';
import '../add_history/add_historys.dart';

class AsHistory extends StatelessWidget {
  final history =
      Get.Get.put(HistoryController()); // variavel que inicia o controller

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
        child: Get.GetX<HistoryController>(
          initState: (state) {
            history.getList();
          }, // pegando a funçao que vai trazer meu conteudo
          builder: (history) {
            return 
            history.listHistory.isEmpty? Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red,), 
            )):
            ListView.builder(
              itemCount: history.listHistory.length,
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
                          history.listHistory[index].nome.toString(),
                          style: GoogleFonts.smythe(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontStyle: FontStyle.italic),
                          ),
                        ),

                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              history.listHistory[index].foto.toString()),
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
                                          history.listHistory[index].foto;
                                      final titulo =
                                          history.listHistory[index].nome;
                                      final corpo =
                                          history.listHistory[index].descricao;
                                      final id = history.listHistory[index].id;

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
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                              title: Text('Deletar História'),
                                              content: Text("Certeza?"),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Não')),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      final id = history
                                                          .listHistory[index].id
                                                          .toString();
                                                      history.deletList(id);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Sim'))
                                              ],
                                            ));
                                  },
                                )
                              ],
                            )),
                        onTap: () {
                          final foto = history.listHistory[index].foto;
                          final titulo = history.listHistory[index].nome;
                          final corpo = history.listHistory[index].descricao;
                          final id = history.listHistory[index].id;

                          history.setHistory(titulo, corpo, foto, id);

                         Get.Get.toNamed('/show_history');
                          
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

      // BUTTON DE ADICONAR UMA HISTORIA
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        child: Icon(Icons.add),
        onPressed: () {
          history.clearHistory(); // funçao de limpar os dados antes de adicionar uma nova historia
          Get.Get.toNamed('/add_history');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
