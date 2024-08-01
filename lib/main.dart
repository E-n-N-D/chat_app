import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter chat app', // shows at the tabbar on web
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ChatPage()
    );
  }
}

