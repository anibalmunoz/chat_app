import 'package:chat_app/models/models.dart';
import 'package:flutter/material.dart';

class UsuarioTile extends StatelessWidget {
  final Usuario usuario;
  const UsuarioTile({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(backgroundColor: Colors.blue[100], child: Text(usuario.nombre.substring(0, 2))),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green : Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
