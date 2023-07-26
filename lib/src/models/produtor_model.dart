class ProdutorModel {
  int? idProdutor;
  String? registroIndividual;
  String? nomeProdutor;
  int? status;

  ProdutorModel(
      {this.idProdutor,
        this.registroIndividual,
        this.nomeProdutor,
        this.status});

  ProdutorModel.fromJson(Map<String, dynamic> json) {
    idProdutor = json['idProdutor'];
    registroIndividual = json['registroIndividual'];
    nomeProdutor = json['nomeProdutor'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProdutor'] = this.idProdutor;
    data['registroIndividual'] = this.registroIndividual;
    data['nomeProdutor'] = this.nomeProdutor;
    data['status'] = this.status;
    return data;
  }
}