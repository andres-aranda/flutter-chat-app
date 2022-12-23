import 'dart:convert';

import 'package:chat_app/models/error_response.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';

import '../global/environment.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  /* #region Properties */
  late Usuario _usuario;

  Usuario get usuario => _usuario;

  bool _autenticando = false;

  bool get autenticando => _autenticando;
  set autenticando(bool value) {
    _autenticando = value;
    notifyListeners();
  }

  final _storage = new FlutterSecureStorage();

  /* #endregion */

  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token ?? '';
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future login(String email, String password) async {
    autenticando = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post(Uri.parse('${Environment.API_URL}/login'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      _usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      autenticando = false;
      return true;
    }
    autenticando = false;
  }

  Future register(String nombre, String email, String password) async {
    autenticando = true;

    final data = {'nombre': nombre, 'email': email, 'password': password};

    final resp = await http.post(Uri.parse('${Environment.API_URL}/login/new'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
    autenticando = false;

    switch (resp.statusCode) {
      case 200:
        final loginResponse = loginResponseFromJson(resp.body);
        _usuario = loginResponse.usuario;
        await _guardarToken(loginResponse.token);
        return true;
      case 400:
        return errorResponseFromJson(resp.body).msg;
      default:
        return 'Comuniquese con el administrador';
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future isLoggedIn() async {
    final token = await _storage.read(key: 'token');

    if (token == null) {
      return false;
    }
    final resp = await http.get(Uri.parse('${Environment.API_URL}/login/renew'),
        headers: {'Content-Type': 'application/json', 'x-token': token});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      await _guardarToken(loginResponse.token);
    } else {
      logout();
    }
  }

  Future logout() async {
    await _storage.delete(key: 'token');
    notifyListeners();
  }
}
