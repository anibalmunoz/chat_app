import 'package:chat_app/pages/pages.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(titulo: "Messenger"),
                LoginForm(),
                LabelsWidget(
                    ruta: RegisterPage.routeName, buttonLabel: "Crear una ahora", subLabel: "¿No tienes cuenta?"),
                Text("Términos y condiciones de uso", style: TextStyle(fontWeight: FontWeight.w200))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
