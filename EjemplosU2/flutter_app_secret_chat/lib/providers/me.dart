import 'package:flutter/material.dart';
import 'package:flutter_app_secret_chat/model/user.dart';
import 'package:provider/provider.dart';

class Me extends ChangeNotifier {
  User _data;

  User get data => _data;

  set data(User user) {
    this._data = user;
    notifyListeners();
  }

  static Me of(BuildContext context) => Provider.of<Me>(context);
}
