import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/widgets/boton_azul.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          icon: Icons.perm_identity,
          isPassworrd: false,
          keyboardType: TextInputType.name,
          placeHolder: "Nombre",
          textController: AuthProvider.emailController,
        ),
        CustomInput(
          icon: Icons.mail_outline,
          isPassworrd: false,
          keyboardType: TextInputType.emailAddress,
          placeHolder: "Correo",
          textController: AuthProvider.emailController,
        ),
        CustomInput(
          icon: Icons.password,
          placeHolder: "Contraseña",
          textController: AuthProvider.passController,
          keyboardType: TextInputType.visiblePassword,
          isPassworrd: true,
        ),
        BotonAzul(
            loading: false,
            onPressed: () {
              print("adsfasfasdfsdfsd");
            },
            text: "Ingresar")
      ]),
    );
  }
}
