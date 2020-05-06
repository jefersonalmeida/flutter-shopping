import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/ui/android/pages/login.page.dart';
import 'package:shopping/ui/android/pages/register.page.dart';

class UnauthenticatedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        FlatButton(
          child: Text('Autentique-se'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
        FlatButton(
          child: Text('Quero me cadastrar'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
