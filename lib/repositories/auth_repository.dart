import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  AuthRepository._();
  static final AuthRepository shared = AuthRepository._();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future guardarToken(String token) async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    await storage.write(key: "token", value: token);
  }

  Future<String> obtenerToken() async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    final token = await storage.read(key: "token");
    return token!;
  }

  Future eliminarToken() async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    await storage.delete(key: "token");
  }
}
