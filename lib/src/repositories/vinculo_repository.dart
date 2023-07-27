import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/vinculo_model.dart';

class VinculoRepository{

  // Guarda o caminho do arquivo JSON que estah localizado na pasta assets
  final url = 'assets/vinculos_202307121529.json';

  Future<List<VinculoModel>> fetchVinculo() async {
    List<VinculoModel> vinculos = [];

    try{

      // Busca e armazena o conteudo do arquivo JSON
      String jsonFile = await rootBundle.loadString(url);

      // Tranformando o arquivo de JSON para MAP
      final Map<String, dynamic> jsonData = json.decode(jsonFile);

      /* Buscando dados contidos no MAP passando a Key('vinculos') para poder ter acesso aos
       dados array e armazenando eles em uma lista */
      List<dynamic> list = jsonData['vinculos'];

      // populando a lista 'vinculos' com os dados obtidos na 'list'
      for (var json in list) {
        final vinculo = VinculoModel.fromJson(json);
        vinculos.add(vinculo);
      }

    }catch (e){
      throw("[ERRO] -> falha ao buscar os dados" , e);
    }


    return vinculos;
  }
}