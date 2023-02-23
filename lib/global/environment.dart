import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid ? '192.168.0.42:3000' : 'localhost:3000';
  static String socketUrl = Platform.isAndroid ? 'localhost:3000' : 'localhost:3000';
}
