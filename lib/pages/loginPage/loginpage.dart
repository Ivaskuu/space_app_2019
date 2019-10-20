import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app_2019/pages/loginPage/registerPage.dart';
import 'package:space_app_2019/states/loginState.dart';

TextEditingController _usernmeController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();
LoginState _notifier;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (_notifier == null) _notifier = Provider.of<LoginState>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'lib/Images/appLogo.png',
              height: 128.0,
              width: 128.0,
            ),
            Column(
              children: <Widget>[
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
                          controller: _usernmeController,
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
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(_notifier.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () => _notifier.modShowPassword(),
                            ),
                          ),
                          obscureText: _notifier.showPassword,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Column(
                  children: <Widget>[
                    FlatButton(
                      child: Text('LOGIN'),
                      textColor: Color.fromRGBO(252, 59, 28, 1), //rosso nasa,
                      onPressed: () => _notifier.login(context),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Don\'t have an account yet?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    FlatButton(
                      child: Text('REGISTER'),
                      textColor: Color.fromRGBO(252, 59, 28, 1), //rosso nasa,
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
