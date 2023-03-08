import 'package:chat_app/pages/pages.dart';
import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  static const routeName = "loading";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    final autentticado = await provider.isLoguedIn();
    if (autentticado) {
      Provider.of<SocketService>(context, listen: false).connect();
      return Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 0),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const UsuariosPage();
            },
          ));
    }
    return Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const LoginPage();
          },
        ));
  }
}
