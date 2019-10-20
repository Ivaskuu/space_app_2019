import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app_2019/states/chatNotifier.dart';

class ReportWidget extends StatefulWidget {
  final dynamic report;
  final int index;

  ReportWidget(this.report, this.index);

  @override
  _ReportWidgetState createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        clipBehavior: Clip.antiAlias,
        elevation: 2.0,
        child: AnimatedSize(
          duration: Duration(milliseconds: 450),
          vsync: this,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: !widget.report.opened ? 64.0 : null,
            child: Center(
              child: widget.report.opened
                  ? Column(
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                            'New report found',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Image.network(
                                widget.report.image,
                                height: 256.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                'Safe zone',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              textColor: Colors.grey,
                              onPressed: () {},
                            ),
                            FlatButton(
                              child: Text(
                                'No',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              textColor: Color.fromRGBO(3, 59, 146, 1),
                              onPressed: () {},
                            ),
                            FlatButton(
                              child: Text(
                                'Yes',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              textColor: Color.fromRGBO(252, 59, 28, 1),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                      ],
                    )
                  : InkWell(
                      onTap: () => Provider.of<ChatNotifier>(context)
                          .changeReportState(widget.index),
                      child: Center(
                        child: Text(
                          'New report found',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
