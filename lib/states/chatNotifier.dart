import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:space_app_2019/Models/message.dart';
import 'package:space_app_2019/Models/report.dart';

class ChatNotifier with ChangeNotifier {
  List<dynamic> _messages = [
    Message(
      location: 'Italy',
      message: 'There\s a fire in Milan!',
      username: 'Pizio Leonardo',
      date: DateTime(2019, 08, 12, 8, 20),
    ),
    ReportedFire(
      location: 'Italy',
      username: 'Pizio Leonardo',
      grade: 2,
      image:
          'https://si.wsj.net/public/resources/images/BN-VN209_3fJmK_OR_20171010153027.jpg?width=620&height=388',
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

  void changeReportState(int index) {
    _messages[index].opened = true;
    notifyListeners();
  }

  void notify() => notifyListeners();

  List<dynamic> get messages => _messages;
}
