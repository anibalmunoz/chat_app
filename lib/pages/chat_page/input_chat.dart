import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputChat extends StatefulWidget {
  final void Function(String) onHandledMessage;

  const InputChat({super.key, required this.onHandledMessage});

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> with TickerProviderStateMixin {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Flexible(
            child: TextField(
              controller: controller,
              onSubmitted: _handleSubmit,
              onChanged: (value) {
                setState(() {
                  if (value.trim().isEmpty) {
                    _estaEscribiendo = false;
                  } else {
                    _estaEscribiendo = true;
                  }
                });
              },
              decoration: const InputDecoration.collapsed(hintText: "Enviar mensaje"),
              focusNode: focusNode,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Platform.isAndroid
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: _estaEscribiendo ? () => _handleSubmit(controller.text.trim()) : null,
                        icon: const Icon(Icons.send),
                      ),
                    ),
                  )
                : CupertinoButton(
                    onPressed: _estaEscribiendo ? () => _handleSubmit(controller.text.trim()) : null,
                    child: const Text("Enviar"),
                  ),
          )
        ]),
      ),
    );
  }

  _handleSubmit(String texto) {
    if (texto.isEmpty) return;
    controller.clear();
    focusNode.requestFocus();
    widget.onHandledMessage(texto);
    setState(() => _estaEscribiendo = false);
  }
}
