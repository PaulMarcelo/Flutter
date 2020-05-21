import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_secret_chat/api/auth_api.dart';
import 'package:flutter_app_secret_chat/model/user.dart';
import 'package:flutter_app_secret_chat/providers/me.dart';
import '../api/profile_api.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authApi = AuthApi();
  final _profileAPI = ProfileApi();
  Me _me;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    this.check();
  }

  check() async {
    final token = await _authApi.getAccessToken();
    if (token != null) {
      final FirebaseUser firebaseUser = (await _auth.signInAnonymously()).user;
      assert(firebaseUser != null);
      assert(firebaseUser.isAnonymous);
      print("firebase Login OK");

      final result = await _profileAPI.getUserInfo(context, token);
      final user = User.fromJson(result);
      _me.data = user;
      Navigator.pushReplacementNamed(context, "home");
    } else {
      Navigator.pushReplacementNamed(context, "login");
    }
  }

  @override
  Widget build(BuildContext context) {
    _me = Me.of(context);
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      ),
    );
  }
}
