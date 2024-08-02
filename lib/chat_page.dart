import 'dart:convert';

import 'package:chat_app/models/message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageEntity> _messages = [];

  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final List<dynamic> decodedMessages = jsonDecode(response) as List;

    final List<MessageEntity> messagesEntity = decodedMessages.map((listItem) {
      return MessageEntity.fromJson(listItem);
    }).toList();

    setState(() {
      _messages = messagesEntity;
    });
  }

  void onMessageSend(MessageEntity newMessage) {
    _messages.add(newMessage);
    setState(() {});
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final username = arguments != null ? arguments as String : 'Sushant';
    return Scaffold(
        appBar: AppBar(
          title: Text('Hi $username'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: _messages[index].author.username == 'Sushant'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        messageEntity: _messages[index]);
                  }),
            ),
            ChatInput(
              onMessageSubmit: onMessageSend,
            )
          ],
        ));
  }
}
