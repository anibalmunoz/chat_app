import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/pages/pages.dart';
import 'package:chat_app/routes/app_routes.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => SocketService())
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: LoadingPage.routeName,
      routes: appRoutes,
    );
  }
}
