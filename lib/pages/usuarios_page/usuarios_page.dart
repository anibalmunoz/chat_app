import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/pages/login_page/login_page.dart';
import 'package:chat_app/pages/usuarios_page/usuario_tile.dart';
import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  static const routeName = "usuarios";

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(online: true, email: "test1@test.com", nombre: "Maria", uid: "1"),
    Usuario(online: false, email: "test2@test.com", nombre: "Rocio", uid: "2"),
    Usuario(online: true, email: "test3@test.com", nombre: "Ivonne", uid: "3"),
  ];

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final socket = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(authProvider.usuario.nombre, style: const TextStyle(color: Colors.black45)),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: _logout, icon: const Icon(Icons.exit_to_app, color: Colors.black45)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: socket.serverStatus == ServerStatus.online
                ? Icon(Icons.check_circle, color: Colors.blue[400])
                : const Icon(Icons.offline_bolt, color: Colors.red),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        header: WaterDropHeader(complete: Icon(Icons.check, color: Colors.blue[400]), waterDropColor: Colors.blue),
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios(),
      ),
    );
  }

  Widget _listViewUsuarios() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => UsuarioTile(usuario: usuarios[index]),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: usuarios.length,
    );
  }

  _cargarUsuarios() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  _logout() {
    Provider.of<AuthProvider>(context, listen: false).logout();
    Provider.of<SocketService>(context, listen: false).disconnect();
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
  }
}
