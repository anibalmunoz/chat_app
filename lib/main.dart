import 'package:chat_app/pages/pages.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: appRoutes,
    );
  }
}
