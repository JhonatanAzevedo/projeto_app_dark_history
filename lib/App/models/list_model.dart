
class HistoryModel {
  final String? foto;
  final String? nome;
  final String? elenco;
  final String? id;
  final String? descricao;

  HistoryModel({this.descricao, this.foto, this.nome, this.elenco, this.id});

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
      id: json["_id"],
      nome: json["nome"],
      foto: json["foto"],
      elenco: json["elenco"],
      descricao: json["descricao"]);
}


class RespModel {
  final String? resp;

  RespModel({this.resp});

  factory RespModel.fromJson(Map<String, dynamic> json) => RespModel(
      resp: json["resp"],
      );
  
}




 