import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/produtor_model.dart';

class ProdutorRepository{
  // final dio = Dio();
  // final url = 'file:///C:/Users/Leonardo/Documents/testeMobile_LeonardoCarvalho/produtores.json';

  //Future<List<ProdutorModel>> fetchProdutor() async {
  //   var response = await rootBundle.loadString('assets/produtores.json');
  //   print(response);
  //   final List<dynamic> jsonList = jsonDecode(response); // Decodifica a string JSON em uma lista de Mapas.
  //
  //   List<ProdutorModel> produtores = [];
  //
  //   for (var json in jsonList) {
  //     final produtor = ProdutorModel.fromJson(json);
  //     produtores.add(produtor);
  //   }
  //
  //   return produtores;
  // }


  Future<List<ProdutorModel>> fetchProdutor() async {
    var jsonFile = await rootBundle.loadString('assets/produtores.json');
    //print(response);
    //dynamic jsonData = jsonDecode(response);
    List<dynamic> listaProdutores = json.encode(jsonFile) as List;
    //List a = jsonList as List;
    //final list = response as List;
    //String jsonString = await rootBundle.loadString('assets/data.json');
    //List<ProdutorModel> produtores = [];


    // for(var json in listaProdutores){
    //   final produtor = ProdutorModel.fromJson(json);
    //   produtores.add(produtor);
    // }

    return listaProdutores.map((c) => ProdutorModel.fromJson(c)).toList();
  }
}