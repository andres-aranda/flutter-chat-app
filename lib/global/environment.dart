import 'dart:io';

class Environment {
  static String API_URL = Platform.isMacOS
      ? 'http://192.168.0.199:3000/api'
      : 'http://192.168.0.199:3000/api';
  static String soketUrl = 'http://192.168.0.199:3000';
}
