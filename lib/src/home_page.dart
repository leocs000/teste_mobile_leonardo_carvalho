import 'package:flutter/material.dart';
import 'package:teste_mobile_leonardo_carvalho/src/controllers/home_page_controller.dart';
import 'package:teste_mobile_leonardo_carvalho/src/enums/state_controller_enum.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/produtor_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController();

  // Chamando a funcao start() para poder popular as listas e podermos trabalhar com os dados
  @override
  void initState(){
    super.initState();
    controller.start();
  }

  // Estado ativo durante o processo de povoacao das listas
  _loading(){
    return Center(child: CircularProgressIndicator());
  }

  // Retorna uma pagina ListView.builder
  _success(){
    return PropriedadeListView(controller: controller);
  }

  // Caso ocorra algum erro no povoamento da lista, será mostrado um botão para atualizar a pagina
  _error(){
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controller.start();
          },
          child: Text('Atualizar Pagina')),
    );
  }

  // Altera entre os estados de acordo com o que é fornecido pelo AnimatorBuilder
  stateManagement(StateController state){
    switch(state){
      case StateController.loading:
        return _loading();
      case StateController.success:
        return _success();
      case StateController.error:
        return _error();
      default:
        return _success();
    }
  }

  // Widget principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Todas propriedades', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
      ),
      backgroundColor: Color(0xffffffff),
      body:  Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return stateManagement(controller.state.value);
            }
          ),
        ),
      ),
    );
  }
}

// Widget que desenha a lista de propriedades
class PropriedadeListView extends StatelessWidget {
  final HomePageController controller;

  PropriedadeListView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.listaPropriedades.length,
      itemBuilder: (context, propriedadeIndex) {
        return Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color: Colors.green,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF2F4F2F)),
                    ),
                    child: Center(
                        child: Text(
                            controller.listaPropriedades[propriedadeIndex].pais ?? ' - ',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        )
                    )
                ),
                SizedBox(height: 10,),
                Text('nome da propriedade: ${controller.listaPropriedades[propriedadeIndex].nomePropriedade ?? ' -- '}'),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text('CAR: ${controller.listaPropriedades[propriedadeIndex].numeroCar ?? ' -- '}'),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Municipio: ${controller.listaPropriedades[propriedadeIndex].municipio ?? ' -- '}'),
                    SizedBox(width: 30,),
                    Text('UF: ${controller.listaPropriedades[propriedadeIndex].uf ?? ' -- '}'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Status: ${controller.listaPropriedades[propriedadeIndex].status ?? ' -- '}'),
                    SizedBox(width: 90,),
                    Text('Situação: ${controller.listaPropriedades[propriedadeIndex].liberado ?? ' -- '}'),
                  ],
                ),
                ProdutorListView(
                  produtores: controller.findProdutoresParaPropriedade(propriedadeIndex),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Widget que desenha a lista de produtores vinculados a propriedade
class ProdutorListView extends StatelessWidget {
  final List<ProdutorModel> produtores;

  ProdutorListView({required this.produtores});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: produtores.length,
      itemBuilder: (context, produtorIndex) {
        return ListTile(
          title: Text(produtores[produtorIndex].nomeProdutor ?? ' -- '),
          subtitle: Text(produtores[produtorIndex].registroIndividual ?? ' -- ')
        );
      },
    );
  }
}