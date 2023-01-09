import 'package:chat_app/models/usuarios_response.dart';

import '../global/environment.dart';
import '../models/usuario.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;

class UsuariosService {
  
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get(Uri.parse('${Environment.API_URL}/usuarios'),
          headers: {
            'Content-Type': 'application/json',
            'x-token': await AuthService.getToken()
          });
      final usuariosResponse = usuarioResponseFromJson(resp.body);
      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}