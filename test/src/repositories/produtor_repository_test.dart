import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile_leonardo_carvalho/src/repositories/produtor_repository.dart';

main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  final produtorRepository = ProdutorRepository();

  test('deve retornar a lista de produtores: ', () async{
    final list = await produtorRepository.fetchProdutor();
    print(list);
  });
}