import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/produtor_model.dart';

class ProdutorRepository{

  // Guarda o caminho do arquivo JSON que estah localizado na pasta assets
  final url = 'assets/produtores.json';

  Future<List<ProdutorModel>> fetchProdutor() async {

    // Busca e armazena o conteudo do arquivo JSON
    String jsonFile = await rootBundle.loadString(url);

    // Tranformando o arquivo de JSON para MAP
    final Map<String, dynamic> jsonData = json.decode(jsonFile);

    /* Buscando dados contidos no MAP passando a Key('produtores') para poder ter acesso aos
       dados array e armazenando eles em uma lista */
    List<dynamic> produtoresList = jsonData['produtores'];

    List<ProdutorModel> produtores = [];

    // populando a lista 'produtores' com os dados obtidos na 'list'
    for (var json in produtoresList) {
      final produtor = ProdutorModel.fromJson(json);
      produtores.add(produtor);
    }

    return produtores;
  }
}