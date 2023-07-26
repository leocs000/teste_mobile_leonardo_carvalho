class UsuarioModel {
  int? idUsuario;
  String? nomeUsuario;
  String? emailUsuario;
  String? senhaUsuario;
  String? descricaoCargo;
  String? industria;

  UsuarioModel(
      {this.idUsuario,
        this.nomeUsuario,
        this.emailUsuario,
        this.senhaUsuario,
        this.descricaoCargo,
        this.industria});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'];
    nomeUsuario = json['nomeUsuario'];
    emailUsuario = json['emailUsuario'];
    senhaUsuario = json['senhaUsuario'];
    descricaoCargo = json['descricaoCargo'];
    industria = json['industria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this.idUsuario;
    data['nomeUsuario'] = this.nomeUsuario;
    data['emailUsuario'] = this.emailUsuario;
    data['senhaUsuario'] = this.senhaUsuario;
    data['descricaoCargo'] = this.descricaoCargo;
    data['industria'] = this.industria;
    return data;
  }
}