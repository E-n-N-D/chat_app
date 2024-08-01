import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hi Sushant'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount: 5, itemBuilder: (context, index) {
                return ChatBubble(
                    alignment: index %2 == 0 ?Alignment.centerLeft: Alignment.centerRight,
                    message: 'This is the message number $index');
              }),
              // child: ListView(
              //   children: [
              //     ChatBubble(alignment: Alignment.centerLeft, message: 'This is the first message'),
              //     ChatBubble(alignment: Alignment.centerRight, message: 'This is the second message')
              //   ],
              // ),
            ),
            ChatInput()
          ],
        ));
  }
}
