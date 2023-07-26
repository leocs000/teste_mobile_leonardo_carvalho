import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/usuario_model.dart';
import 'package:teste_mobile_leonardo_carvalho/src/repositories/usuario_repository.dart';

main(){

  final usuarioRepository = UsuarioRepository();

  test('deve retornar a lista de produtores: ', () async{
    TestWidgetsFlutterBinding.ensureInitialized();
    final List<UsuarioModel> list = await usuarioRepository.fetchUsuario();
    print(list[2].nomeUsuario);
  });
}