import 'package:chat_app/pages/login_page/login_page.dart';
import 'package:chat_app/pages/register_page/register_form.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const routeName = "register";

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
                Logo(titulo: "Registro"),
                RegisterForm(),
                LabelsWidget(
                  ruta: LoginPage.routeName,
                  buttonLabel: "Ingresa con tu cuenta",
                  subLabel: "¿Ya tienes cuenta?",
                ),
                Text("Términos y condiciones de uso", style: TextStyle(fontWeight: FontWeight.w200))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
