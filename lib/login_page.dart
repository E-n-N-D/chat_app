import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, 'chat',
          arguments: usernameController.text);
      print('Login Successful!');
    } else {
      print("Login not successful!");
    }
  }

  static const url = 'https://github.com/E-n-N-D';
  final Uri uri = Uri.parse(url);
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
              verticalSpacing(15),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/banner_image.png'),
                    ),
                    borderRadius: BorderRadius.circular(24)),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginTextField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Your username should bemore than 5 characters!";
                        } else if (value == null || value.isEmpty) {
                          return "Please type your username!";
                        }
                        return null;
                      },
                      controller: usernameController,
                      hintText: 'Your username',
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      isSecured: true,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 8) {
                          return "Your password does not match!";
                        } else if (value == null || value.isEmpty) {
                          return "Please type your password!";
                        }
                        return null;
                      },
                      controller: passwordController,
                      hintText: 'Your password',
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
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
                onTap: () async {
                  print('Link clicked');
                  if (!await launchUrl(uri)) {
                    throw 'Could not launch this!';
                  }
                },
                child: const Column(
                  children: [Text('Find me on'), Text(url)],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.github(url: url),
                  SocialMediaButton.linkedin(
                      url:
                          'https://www.linkedin.com/in/sushant-adhikari-684647206/')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
