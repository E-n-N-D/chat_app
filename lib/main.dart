import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AuthService(), child: ChatApp()));
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter chat app', // shows at the tabbar on web
        theme: ThemeData(
            primarySwatch: BrandColor.primaryColor,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.blue, foregroundColor: Colors.black)),
        home: FutureBuilder<bool>(
            future: context.watch<AuthService>().isLoggedIn(),
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data!) {
                  print("Main page ${snapshot.data}");
                  return ChatPage();
                } else {
                  return LoginPage();
                }
              }
              return CircularProgressIndicator();
            }),
        routes: {
          'chat': (context) => FutureBuilder<bool>(
              future: context.watch<AuthService>().isLoggedIn(),
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data!) {
                    return ChatPage();
                  } else {
                    Navigator.maybePop(context);
                    Navigator.pushNamed(context, '/');
                  }
                }
                return CircularProgressIndicator();
              }),
        });
  }
}
