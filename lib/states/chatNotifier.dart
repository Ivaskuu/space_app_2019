import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:space_app_2019/Models/message.dart';

class ChatNotifier with ChangeNotifier {
  List<Message> _messages = [
    Message(
      location: 'Italy',
      message: 'There\s a fire in Milan!',
      username: 'Pizio Leonardo',
      date: DateTime(2019, 08, 12, 8, 20),
    ),
    Message(
      username: 'Adrian Ivascu',
      message: 'The firefighters are coming',
      location: 'Italy',
      date: DateTime(2019, 10, 10, 18, 41),
    ),
  ];
  TextEditingController controller = new TextEditingController();

  void addMessage(Message message) {
    _messages.add(message);
    controller = new TextEditingController();
    notifyListeners();
  }

  void notify() => notifyListeners();

  List<Message> get messages => _messages;
}
