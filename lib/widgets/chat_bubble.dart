import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Alignment alignment;
  const ChatBubble({super.key, required this.alignment, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
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
            Text('$message'),
            Image.network(
              'https://i.imgur.com/eCYK8td.jpeg',
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
