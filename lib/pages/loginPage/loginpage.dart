import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'MARCO APOLLO',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 128.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(8.0),
                    clipBehavior: Clip.antiAlias,
                    elevation: 6.0,
                    shadowColor: Colors.black54,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Username/Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(8.0),
                    clipBehavior: Clip.antiAlias,
                    elevation: 6.0,
                    shadowColor: Colors.black54,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            FlatButton(
              child: Text('LOGIN'),
              textColor: Color.fromRGBO(252, 59, 28, 1), //rosso nasa,
              onPressed: () {},
            ),
            SizedBox(
              height: 8.0,
            ),
            Text('Dont have an account yet?'),
            SizedBox(
              height: 8.0,
            ),
            FlatButton(
              child: Text('REGISTER'),
              textColor: Color.fromRGBO(252, 59, 28, 1), //rosso nasa,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
