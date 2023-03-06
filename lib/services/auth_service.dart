import 'package:api_module/mobile_module_api.dart';
import 'package:chat_app/global/environment.dart';
import 'package:chat_app/providers/url_provider.dart';

class AuthService {
  AuthService._();
  static final AuthService shared = AuthService._();

  Future<ResponseData> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };
    final response = await ApiManager.shared.request(
      baseUrl: Environment.apiUrl,
      pathUrl: loginUrl,
      type: HttpType.post,
      body: data,
      isHttp: true,
    );
    return response;
  }

  Future<ResponseData> register(String nombre, String email, String password) async {
    final data = {
      'nombre': nombre,
      'email': email,
      'password': password,
    };
    final response = await ApiManager.shared.request(
      baseUrl: Environment.apiUrl,
      pathUrl: registerUrl,
      type: HttpType.post,
      body: data,
      isHttp: true,
    );
    return response;
  }
}
