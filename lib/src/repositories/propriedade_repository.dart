import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/propriedade_model.dart';

class PropriedadeRepository{

  // Guarda o caminho do arquivo JSON que estah localizado na pasta assets
  final url = 'assets/propriedades_202307121529.json';

  Future<List<PropriedadeModel>> fetchPropriedade() async {

    // Busca e armazena o conteudo do arquivo JSON
    String jsonFile = await rootBundle.loadString(url);

    // Tranformando o arquivo de JSON para MAP
    final Map<String, dynamic> jsonData = json.decode(jsonFile);

    /* Buscando dados contidos no MAP passando a Key('propriedades') para poder ter acesso aos
       dados array e armazenando eles em uma lista */
    List<dynamic> list = jsonData['propriedades'];

    List<PropriedadeModel> propriedades = [];

    // populando a lista 'propriedades' com os dados obtidos na 'list'
    for (var json in list) {
      final propriedade = PropriedadeModel.fromJson(json);
      propriedades.add(propriedade);
    }

    return propriedades;
  }
}