import 'package:chat_app/pages/pages.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  ChatPage.routeName: (context) => ChatPage(),
  LoadingPage.routeName: (context) => const LoadingPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
  UsuariosPage.routeName: (context) => const UsuariosPage(),
};
