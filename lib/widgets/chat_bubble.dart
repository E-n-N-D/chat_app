import 'package:chat_app/models/message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final MessageEntity messageEntity;
  final Alignment alignment;
  const ChatBubble(
      {super.key, required this.alignment, required this.messageEntity});

  @override
  Widget build(BuildContext context) {
    bool isAuthor = messageEntity.author.username == 'Sushant';
    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: isAuthor ? Theme.of(context).primaryColor : Colors.black54,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: isAuthor ? Radius.circular(14) : Radius.zero,
                bottomRight: isAuthor ? Radius.zero : Radius.circular(14))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              messageEntity.text,
              style: TextStyle(color: Colors.white),
            ),
            if (messageEntity.imageUrl != null)
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(messageEntity.imageUrl!),
                    ),
                    borderRadius: BorderRadius.circular(12)),
              )
          ],
        ),
      ),
    );
  }
}
