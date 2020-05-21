import 'package:flutter/material.dart';
import 'package:flutter_app_secret_chat/page/login.dart';
import 'package:flutter_app_secret_chat/providers/chat_providers.dart';
import 'package:flutter_app_secret_chat/providers/me.dart';
import 'package:provider/provider.dart';

import 'page/home.dart';
import 'page/sign_up.dart';
import 'page/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => Me(),
        ),
        ChangeNotifierProvider(
          builder: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
        routes: {
          "splash": (context) => SplashPage(),
          "login": (context) => LoginPage(),
          "singup": (context) => SingUpPage(),
          "home": (context) => HomePage(),
        },
      ),
    );
  }
}
