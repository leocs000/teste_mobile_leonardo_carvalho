import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/propriedade_model.dart';
import 'package:teste_mobile_leonardo_carvalho/src/repositories/propriedade_repository.dart';

main(){

  final propriedadeRepository = PropriedadeRepository();

  test('deve retornar a lista de produtores: ', () async{
    TestWidgetsFlutterBinding.ensureInitialized();
    final List<PropriedadeModel> list = await propriedadeRepository.fetchPropriedade();
    print(list[1].nomePropriedade);
  });
}