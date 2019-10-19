import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app_2019/Models/message.dart';
import 'package:space_app_2019/pages/networkChat/messageWidget.dart';
import 'package:space_app_2019/states/chatNotifier.dart';

ChatNotifier _notifier;

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (_notifier == null) _notifier = Provider.of<ChatNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Emergency chat',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 34.0),
            itemCount: _notifier.messages.length,
            itemBuilder: (context, index) =>
                MessageWidget(_notifier.messages[index]),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 4.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - 80.0,
                  child: TextField(
                    controller: _notifier.controller,
                    onChanged: (_) => _notifier.notify(),
                    textCapitalization: TextCapitalization.sentences,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Color.fromRGBO(3, 59, 146, 1),
                  onPressed: _notifier.controller.text != ''
                      ? () => _notifier.addMessage(
                            new Message(
                              message: _notifier.controller.text,
                              username: 'Simone Scino',
                              location: 'Italy',
                            ),
                          )
                      : null,
                ),
              ],
            ),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
