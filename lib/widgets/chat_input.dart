import 'package:chat_app/models/message_entity.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function(MessageEntity) onMessageSubmit;
  ChatInput({super.key, required this.onMessageSubmit});

  final chatMessageController = TextEditingController();

  void onMsgSend() {
    print(chatMessageController.text);
    final newMessage = MessageEntity(
        text: chatMessageController.text,
        id: '1',
        createdAt: DateTime.now().microsecondsSinceEpoch,
        author: Author(username: 'Sushant'));

    onMessageSubmit(newMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white)),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            minLines: 1,
            controller: chatMessageController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Type your text',
              hintStyle: TextStyle(color: Colors.blueGrey),
              border: InputBorder.none,
            ),
          )),
          IconButton(
              onPressed: onMsgSend,
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
