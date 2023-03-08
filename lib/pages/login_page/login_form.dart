import 'package:chat_app/helpers/show_alert.dart';
import 'package:chat_app/pages/usuarios_page/usuarios_page.dart';
import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:chat_app/widgets/boton_azul.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final socket = Provider.of<SocketService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          icon: Icons.mail_outline,
          isPassworrd: false,
          keyboardType: TextInputType.emailAddress,
          placeHolder: "Correo",
          textController: authProvider.emailController,
        ),
        CustomInput(
          icon: Icons.password,
          placeHolder: "Contraseña",
          textController: authProvider.passController,
          keyboardType: TextInputType.visiblePassword,
          isPassworrd: true,
        ),
        BotonAzul(
          loading: authProvider.autenticando,
          onPressed: authProvider.autenticando ? null : _onLoginPressed,
          text: "Ingresar",
        )
      ]),
    );
  }

  _onLoginPressed() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    FocusScope.of(context).unfocus();
    final ok = await authProvider.login();
    if (!ok) {
      return mostrarAlerta(context, titulo: "Login incorrecto", subtitulo: "Revisa tus credenciales");
    }
    Provider.of<SocketService>(context, listen: false).connect();
    Navigator.pushReplacementNamed(context, UsuariosPage.routeName);
  }
}
