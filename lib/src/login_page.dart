import 'package:flutter/material.dart';
import 'package:teste_mobile_leonardo_carvalho/src/controllers/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  String email = '';
  String senha = '';

  login(){
    LoginPageController loginController = LoginPageController();
    email = _emailController.text;
    senha = _senhaController.text;
    loginController.login(email, senha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                  child: Text('Entrar')

              ),
            ],
          ),
        ),
      ),
    );
  }
}
