import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app_2019/states/navigationState.dart';

class PageWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final int index;

  PageWidget({
    this.name,
    this.icon,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Provider.of<NavigationState>(context).changepage(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon,
                color: index == Provider.of<NavigationState>(context).index
                    ? Color.fromRGBO(3, 59, 146, 1)
                    : Colors.black54),
            Text(
              name,
              style: TextStyle(
                fontWeight: index == Provider.of<NavigationState>(context).index
                    ? FontWeight.bold
                    : null,
                color: index == Provider.of<NavigationState>(context).index
                    ? Color.fromRGBO(3, 59, 146, 1)
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
