import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_secret_chat/api/auth_api.dart';
import 'package:flutter_app_secret_chat/model/message.dart';
import 'package:flutter_app_secret_chat/model/user.dart';
import 'package:flutter_app_secret_chat/providers/chat_providers.dart';
import 'package:flutter_app_secret_chat/providers/me.dart';
import 'package:flutter_app_secret_chat/utils/dialogs.dart';
import 'package:flutter_app_secret_chat/utils/session.dart';
import 'package:flutter_app_secret_chat/utils/socket_client.dart';
import 'package:flutter_app_secret_chat/widget/chat.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String a;
  final _chatKey = GlobalKey<ChatState>();
  Me _me;
  ChatProvider _chat;
  final _authAPI = AuthApi();
  final _socketClient = SocketClient();

  @override
  void initState() {
    a = ModalRoute.of(context).settings.arguments;
    super.initState();
    this._connectSocket();
  }

  @override
  void dispose() {
    super.dispose();
    this._socketClient.disconnect();
  }

  void _connectSocket() async {
    final token = await _authAPI.getAccessToken();
    await _socketClient.connect(token);
    _socketClient.onNewMessage = (data) => _addOnNewMessage(data, true);

    _socketClient.onNewFile = (data) => _addOnNewMessage(data, false);

    _socketClient.onConnected = (data) {
      final users = Map<String, dynamic>.from(data['connectedUsers']);
      _chat.counter = users.length;
      print("_chat.counter: ${_chat.counter}");
    };

    _socketClient.onJoined = (data) {
      _chat.counter++;
      print("_chat.counter: ${_chat.counter}");
    };

    _socketClient.onDisconnected = (data) {
      if (_chat.counter > 0) _chat.counter--;
      print("_chat.counter: ${_chat.counter}");
    };
  }

  _addOnNewMessage(dynamic data, bool isText) {
    final message = Message(
        id: data['from']['id'],
        message: isText ? data['message'] : data['file']['url'],
        type: isText ? MessageType.text : data['file']['type'],
        username: data['from']['username'],
        createAt: DateTime.now());
    _chat.addMessage(message);
    _chatKey.currentState?.checkUnread();
  }

  @override
  Widget build(BuildContext context) {
    this._me = Me.of(context);
    this._chat = ChatProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          "Connected: (${_chat.counter})",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (String value) {
              if (value == "exit") {
                _onExit();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "share",
                child: Text("Share App"),
              ),
              PopupMenuItem(
                value: "exit",
                child: Text("Exit App"),
              )
            ],
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: Chat(
        _me.data.id,
        key: _chatKey,
        messages: _chat.messages,
        onSend: _sentMessage,
      )),
    );
  }

  _sentMessage(String text, bool isText) {
    Message message = Message(
        id: _me.data.id,
        username: _me.data.username,
        message: text,
        type: isText?MessageType.text:MessageType.image,
        createAt: DateTime.now());

    if (isText) {
      _socketClient.emmit('send', text);
    } else {
      _socketClient.emmit('send-file', {
        "type": MessageType.image,
        "url": text,
      });
    }
    _chat.addMessage(message);
    _chatKey.currentState?.goToEnd();
  }

  _onExit() {
    Dialogs.confirm(context, title: "COFIRM", message: "Are you sure?",
        onCancel: () {
      Navigator.pop(context);
    }, onConfirm: () async {
      Navigator.pop(context);
      Session session = Session();
      await session.clear();
      Navigator.pushNamedAndRemoveUntil(context, 'login', (_) => false);
    });
  }
}
