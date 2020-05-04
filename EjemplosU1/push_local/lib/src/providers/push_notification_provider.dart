import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifiationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print('token: ');
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (info) async {
        print('====== on Message =====');
        print(info);
        String argumento = 'no-data';

        if (Platform.isAndroid) {
          argumento = info['data']['comida'] ?? 'no-data';
        }

        _mensajesStreamController.sink.add(argumento);
      },
      onLaunch: (info) async {
        print('====== on onLaunch =====');
        print(info);
        final noti = info['data']['comida'];
        _mensajesStreamController.sink.add(noti);
      },
      onResume: (info) async {
        print('====== on onResume =====');
        print(info);
        final noti = info['data']['comida'];
        _mensajesStreamController.sink.add(noti);
      },
    );
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
