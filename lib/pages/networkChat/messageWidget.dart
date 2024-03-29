import 'package:flutter/material.dart';
import 'package:space_app_2019/Models/message.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  MessageWidget(this.message);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: message.username == 'Simone Scino'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: message.username == 'Simone Scino'
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: <Widget>[
              Text(
                message.username == 'Simone Scino' ? 'Me' : message.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text('in ${message.location}'),
              SizedBox(
                width: 8.0,
              ),
              Text(
                  '${message.date.year}/${message.date.month}/${message.date.day}' +
                      ' ${message.date.hour}:${message.date.minute}'),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Material(
            elevation: 10.0,
            shadowColor: Colors.black54,
            borderRadius: BorderRadius.circular(12.0),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(message.message),
                    SizedBox(
                      height: 8.0,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
