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
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('This is the message!'),
                  Image.network(
                    'https://i.imgur.com/eCYK8td.jpeg',
                    height: 100,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14))),
            ),
            Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('This is the message!'),
                  Image.network(
                    'https://i.imgur.com/eCYK8td.jpeg',
                    height: 100,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14))),
            ),
            Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('This is the message!'),
                  Image.network(
                    'https://i.imgur.com/eCYK8td.jpeg',
                    height: 100,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14))),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ))
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(14))),
            ),
          ],
        ));
  }
}
