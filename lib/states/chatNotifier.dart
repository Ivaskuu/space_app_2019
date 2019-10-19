import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:space_app_2019/Models/message.dart';

class ChatNotifier with ChangeNotifier {
  List<Message> _messages = [
    Message(
        location: 'Italy',
        message: 'There\s a fire in Milan!',
        username: 'Pizio Leonardo'),
    Message(
        username: 'Adrian Ivascu',
        message: 'The firefighters are coming',
        location: 'Italy'),
  ];
  TextEditingController controller = new TextEditingController();

  void addMessage(Message message) {
    _messages.add(message);
    controller = new TextEditingController();
    notifyListeners();
  }

  List<Message> get messages => _messages;
}
