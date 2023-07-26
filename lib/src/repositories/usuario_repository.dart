import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/usuario_model.dart';

class UsuarioRepository{

  // Guarda o caminho do arquivo JSON que estah localizado na pasta assets
  final url = 'assets/usuarios_202307121529.json';

  Future<List<UsuarioModel>> fetchUsuario() async {

    // Busca e armazena o conteudo do arquivo JSON
    String jsonFile = await rootBundle.loadString(url);

    // Tranformando o arquivo de JSON para MAP
    final Map<String, dynamic> jsonData = json.decode(jsonFile);

    /* Buscando dados contidos no MAP passando a Key('usuarios') para poder ter acesso aos
       dados array e armazenando eles em uma lista */
    List<dynamic> list = jsonData['usuarios'];

    List<UsuarioModel> usuarios = [];

    // populando a lista 'usuarios' com os dados obtidos na 'list'
    for (var json in list) {
      final usuario = UsuarioModel.fromJson(json);
      usuarios.add(usuario);
    }

    return usuarios;
  }
}