import 'package:api_module/mobile_module_api.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/models.dart';
import 'package:chat_app/repositories/auth_repository.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  bool _autenticando = false;
  late Usuario usuario;

  bool get autenticando => _autenticando;
  set autenticando(bool aut) {
    _autenticando = aut;
    notifyListeners();
  }

  Future<bool> login() async {
    autenticando = true;
    final res = await AuthService.shared.login(
      emailController.text.trim(),
      passController.text.trim(),
    );
    autenticando = false;
    if (res.status == HttpStatus.success) {
      final loginRes = LoginResponse.fromJson(res.recordset);
      usuario = loginRes.usuario;
      AuthRepository.shared.guardarToken(loginRes.token);
      return true;
    }
    return false;
  }
}