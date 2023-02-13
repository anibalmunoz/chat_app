import 'package:chat_app/providers/login_provider.dart';
import 'package:chat_app/widgets/boton_azul.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          icon: Icons.mail_outline,
          isPassworrd: false,
          keyboardType: TextInputType.emailAddress,
          placeHolder: "Correo",
          textController: LoginProvider.emailController,
        ),
        CustomInput(
          icon: Icons.password,
          placeHolder: "Contraseña",
          textController: LoginProvider.passController,
          keyboardType: TextInputType.visiblePassword,
          isPassworrd: true,
        ),
        BotonAzul(
            onPressed: () {
              print("adsfasfasdfsdfsd");
            },
            text: "Ingresar")
      ]),
    );
  }
}
