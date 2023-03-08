import 'package:chat_app/helpers/show_alert.dart';
import 'package:chat_app/pages/pages.dart';
import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:chat_app/widgets/boton_azul.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          icon: Icons.perm_identity,
          isPassworrd: false,
          keyboardType: TextInputType.name,
          placeHolder: "Nombre",
          textController: provider.nameController,
        ),
        CustomInput(
          icon: Icons.mail_outline,
          isPassworrd: false,
          keyboardType: TextInputType.emailAddress,
          placeHolder: "Correo",
          textController: provider.emailController,
        ),
        CustomInput(
          icon: Icons.password,
          placeHolder: "Contraseña",
          textController: provider.passController,
          keyboardType: TextInputType.visiblePassword,
          isPassworrd: true,
        ),
        BotonAzul(
            loading: provider.autenticando,
            onPressed: provider.autenticando ? null : _onRegisterPressed,
            text: "Crear cuenta")
      ]),
    );
  }

  _onRegisterPressed() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    FocusScope.of(context).unfocus();
    final ok = await authProvider.register();
    if (ok) {
      Provider.of<SocketService>(context, listen: false).connect();
      Navigator.pushReplacementNamed(context, UsuariosPage.routeName);
    } else {
      mostrarAlerta(context, titulo: 'Registro incorrecto', subtitulo: ok);
    }
  }
}
