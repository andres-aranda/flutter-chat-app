import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
      required this.texto,
      required this.uid,
      required this.animationController});

  final String texto;
  final String uid;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: this.uid == '123' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(
          right: 5,
          bottom: 5,
          left: 50,
        ),
        child: Text(this.texto, style: const TextStyle(color: Colors.white)),
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(
          right: 50,
          bottom: 5,
          left: 5,
        ),
        child: Text(this.texto, style: const TextStyle(color: Colors.black87)),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
