import 'package:chat_app/models/message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final MessageEntity messageEntity;
  final Alignment alignment;
  const ChatBubble(
      {super.key, required this.alignment, required this.messageEntity});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: Radius.circular(14))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(messageEntity.text),
            if (messageEntity.imageUrl != null)
              Image.network(
                messageEntity.imageUrl!,
                height: 100,
              )
          ],
        ),
      ),
    );
  }
}
