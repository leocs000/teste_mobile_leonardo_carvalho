import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/vinculo_model.dart';
import 'package:teste_mobile_leonardo_carvalho/src/repositories/vinculo_repository.dart';

main(){

  final vinculoRepository = VinculoRepository();

  test('deve retornar a lista de produtores: ', () async{
    TestWidgetsFlutterBinding.ensureInitialized();
    final List<VinculoModel> list = await vinculoRepository.fetchVinculo();
    print(list[3].idProdutor);
  });
}