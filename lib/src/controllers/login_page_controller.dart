import 'package:teste_mobile_leonardo_carvalho/src/models/usuario_model.dart';
import 'package:teste_mobile_leonardo_carvalho/src/repositories/usuario_repository.dart';

class LoginPageController{
  final usuarioRepository = UsuarioRepository();


  login(String email, String senha) async {

    try{
      final List<UsuarioModel> listaUsuario = await usuarioRepository.fetchUsuario();

      for(var usuario in listaUsuario){
        if(usuario.emailUsuario == email && usuario.senhaUsuario == senha){
          print('usuario logado');
          return;
        }else{
          print(email);
          print(senha);
          return;
        }
      }
    }catch (e){
      throw("Usuário nao encontrado", e);
    }

  }
}