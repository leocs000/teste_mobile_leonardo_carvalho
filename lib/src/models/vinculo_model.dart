class VinculoModel {
  int? idVinculo;
  int? idPropriedade;
  int? idProdutor;

  VinculoModel({this.idVinculo, this.idPropriedade, this.idProdutor});

  VinculoModel.fromJson(Map<String, dynamic> json) {
    idVinculo = json['idVinculo'];
    idPropriedade = json['idPropriedade'];
    idProdutor = json['idProdutor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idVinculo'] = this.idVinculo;
    data['idPropriedade'] = this.idPropriedade;
    data['idProdutor'] = this.idProdutor;
    return data;
  }
}