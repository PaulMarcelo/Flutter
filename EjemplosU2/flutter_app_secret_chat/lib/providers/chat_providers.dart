import 'package:flutter/cupertino.dart';
import 'package:flutter_app_secret_chat/model/message.dart';
import 'package:provider/provider.dart';

class ChatProvider extends ChangeNotifier {
  int _counter = 0;
  List<Message> _messages = List();

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  List<Message> get messages => _messages;

  set messages(List<Message> value) {
    _messages = value;
    notifyListeners();
  }

  void addMessage(Message message){
    _messages.add(message);
    notifyListeners();
  }

  void removeMessage(int index){
    _messages.removeAt(index);
    notifyListeners();
  }

  void clearMessage(){
    _messages.clear();
    notifyListeners();
  }

  static ChatProvider of(BuildContext context) =>
      Provider.of<ChatProvider>(context);
}
