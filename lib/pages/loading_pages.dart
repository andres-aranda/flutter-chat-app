import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _checkLogin(context),
      builder: ((context, snapshot) => Center(
            child:  CircularProgressIndicator(
              color: Colors.blue,
            ),
          )),
    ));
  }

  Future _checkLogin(BuildContext context) async {
    final _authService = Provider.of<AuthService>(context);

    final autenticado = await _authService.isLoggedIn();

    if (autenticado) {
      // Conectar al socket server
      Navigator.pushReplacementNamed(context, 'usuarios');
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
