import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: const Column(
        children: [
          Text('Let\'s Sign you in!!!')
        ],
      ),
    );
  }
}
