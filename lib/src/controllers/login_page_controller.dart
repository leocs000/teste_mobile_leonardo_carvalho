import 'package:flutter/material.dart';
import 'package:teste_mobile_leonardo_carvalho/src/models/usuario_model.dart';
import 'package:teste_mobile_leonardo_carvalho/src/repositories/usuario_repository.dart';

class LoginPageController{
  final usuarioRepository = UsuarioRepository();


  Future login(BuildContext context,String email, String senha) async {

    final List<UsuarioModel> listaUsuario = await usuarioRepository.fetchUsuario();

    for(var usuario in listaUsuario){
      if(usuario.emailUsuario == email && usuario.senhaUsuario == senha){
        Navigator.pushReplacementNamed(context, '/home');
        return;
      }
    }

  }
}