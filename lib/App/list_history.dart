import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/list_model.dart';

class AsHistory extends StatefulWidget {
  @override
  _AsHistoryState createState() => _AsHistoryState();
}

class _AsHistoryState extends State<AsHistory> {
  final dio = Dio();

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
        /* width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height, */
        color: Colors.black,
        child: FutureBuilder<List>(
            future: listHistory(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro ao carregar Historias'),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                      ),
                      child: Material(
                        //elevation: 20,
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
                            //subtitle: Text(snapshot.data![index].id),
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage(snapshot.data![index].foto),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed('/historys');
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/AddHistory');
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniEndTop,
    );
  }
}
