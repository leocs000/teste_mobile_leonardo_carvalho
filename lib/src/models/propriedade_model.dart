class PropriedadeModel {
  int? idPropriedade;
  String? nomePropriedade;
  String? numeroCar;
  String? uf;
  String? municipio;
  String? pais;
  int? status;
  int? liberado;

  PropriedadeModel(
      {this.idPropriedade,
        this.nomePropriedade,
        this.numeroCar,
        this.uf,
        this.municipio,
        this.pais,
        this.status,
        this.liberado});

  PropriedadeModel.fromJson(Map<String, dynamic> json) {
    idPropriedade = json['idPropriedade'];
    nomePropriedade = json['nomePropriedade'];
    numeroCar = json['numeroCar'];
    uf = json['uf'];
    municipio = json['municipio'];
    pais = json['pais'];
    status = json['status'];
    liberado = json['liberado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPropriedade'] = this.idPropriedade;
    data['nomePropriedade'] = this.nomePropriedade;
    data['numeroCar'] = this.numeroCar;
    data['uf'] = this.uf;
    data['municipio'] = this.municipio;
    data['pais'] = this.pais;
    data['status'] = this.status;
    data['liberado'] = this.liberado;
    return data;
  }
}