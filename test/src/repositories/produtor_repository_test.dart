import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/produtor_model.dart';
import 'package:teste_mobile_leonardo_carvalho/src/repositories/produtor_repository.dart';

main(){

  final produtorRepository = ProdutorRepository();

  test('deve retornar a lista de produtores: ', () async{
    TestWidgetsFlutterBinding.ensureInitialized();
    final List<ProdutorModel> list = await produtorRepository.fetchProdutor();
    print(list[0].nomeProdutor);
  });
}