import 'package:chat_app/pages/chat_page/input_chat.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  static const routeName = "chat";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            radius: 14,
            child: const Text("Te", style: TextStyle(fontSize: 12)),
          ),
          const SizedBox(height: 3),
          const Text("Melisa Flores", style: TextStyle(color: Colors.black87, fontSize: 12))
        ]),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              reverse: true,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          const Divider(height: 1),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: 60,
            child: InputChat(
              onHandledMessage: (texto) {
                final newMessage = ChatMessage(
                  texto: texto,
                  uid: "123",
                  animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 400)),
                );
                _messages.insert(0, newMessage);
                newMessage.animationController.forward();
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}
