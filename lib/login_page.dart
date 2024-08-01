import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();

  void loginUser() {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print('Login Successful!');
    } else {
      print("Login not successful!");
    }
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Let\'s Sign you in!!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              const Text(
                'Welcome back! \n You\'ve been missed.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              Image.network('https://i.imgur.com/eCYK8td.jpeg', height: 100),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isNotEmpty && value.length < 5) {
                          return "Your username should bemore than 5 characters!";
                        } else if (value == null || value.isEmpty) {
                          return "Please type your username!";
                        }
                        return null;
                      },
                      controller: usernameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Your username',
                          hintStyle: TextStyle(color: Colors.blueGrey)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isNotEmpty && value.length < 8) {
                          return "Your password does not match!";
                        } else if (value == null || value.isEmpty) {
                          return "Please type your password!";
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Your password',
                          hintStyle: TextStyle(color: Colors.blueGrey)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)))),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  )),
              GestureDetector(
                onTap: () {
                  print('Link clicked');
                },
                child: const Column(
                  children: [
                    Text('Find me on'),
                    Text('https://github.com/E-n-N-D')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
