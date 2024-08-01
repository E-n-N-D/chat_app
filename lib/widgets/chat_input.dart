import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  final chatMessageController = TextEditingController();

  void onMsgSend() {
    print(chatMessageController.text);
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
              onPressed: () {}, icon: const Icon(Icons.add, color: Colors.white)),
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
