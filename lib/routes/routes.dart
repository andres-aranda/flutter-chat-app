import 'package:flutter/material.dart';

import '../pages/chat_pages.dart';
import '../pages/loading_pages.dart';
import '../pages/login_pages.dart';
import '../pages/register_pages.dart';
import '../pages/usuarios_pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'register': (BuildContext context) => RegisterPage(),
  'usuarios': (BuildContext context) => UsuariosPage(),
  'chat': (BuildContext context) => ChatPage(),
  'login': (BuildContext context) => LoginPage(),
  'loading': (BuildContext context) => LoadingPage(),
};
