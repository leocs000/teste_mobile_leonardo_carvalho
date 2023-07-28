import 'package:flutter/cupertino.dart';
import 'package:teste_mobile_leonardo_carvalho/src/enums/state_controller_enum.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/vinculo_model.dart';

import '../models/produtor_model.dart';
import '../models/propriedade_model.dart';
import '../repositories/produtor_repository.dart';
import '../repositories/propriedade_repository.dart';
import '../repositories/vinculo_repository.dart';

class HomePageController {

  // Variaveis de acesso aos repositórios
  final propriedadeRepository = PropriedadeRepository();
  final produtorRepository = ProdutorRepository();
  final vinculoRepository = VinculoRepository();

  // Variaveis que iram receber os dados a serem manipulados
  List<PropriedadeModel> listaPropriedades = [];
  List<ProdutorModel> listaProdutores = [];
  List<VinculoModel> listaVinculos = [];

  // Atribuindo estado inicial
  final state = ValueNotifier<StateController>(StateController.start);

  // Funcao com responsabilidade de popular os arrays e alterar os estados
  Future start() async {
    state.value = StateController.loading;

    try{
      listaPropriedades = await propriedadeRepository.fetchPropriedade();
      listaProdutores = await produtorRepository.fetchProdutor();
      listaVinculos = await vinculoRepository.fetchVinculo();
      state.value = StateController.success;
    }catch (e){
      state.value = StateController.error;
    }

  }

  // Funcao para encontrar todos os produtores alocados em uma propriedade
  List<ProdutorModel> findProdutoresParaPropriedade(int propriedadeIndex) {
    int? idPropriedade = listaPropriedades[propriedadeIndex].idPropriedade;
    List<ProdutorModel> produtoresEncontrados = [];

    // Rodando a lista de vinculos para achar os ids dos produtores vinculados a propriedade na posicao[propriedadeIndex]
    for (int i = 0; i < listaVinculos.length; i++) {
      if (listaVinculos[i].idPropriedade == idPropriedade) {
        int? idProdutor = listaVinculos[i].idProdutor;

        // Buscando os dados do produtor com o idProdutor e adicionando eles a lista
        for (int j = 0; j < listaProdutores.length; j++) {
          if (listaProdutores[j].idProdutor == idProdutor) {
            produtoresEncontrados.add(listaProdutores[j]);
          }
        }
      }
    }

    return produtoresEncontrados;
  }

}

