import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _buttonEnabled = false;

  void _nextStep() {
    print("Botão Ativado");
  }

  void _changeEmail(value) {
    print(value);

    _buttonEnabled = EmailValidator.validate(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: _changeEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail", labelStyle: TextStyle(fontSize: 30.0)),
            ),
            MaterialButton(
              minWidth: double.infinity,
              child: Text(
                'Continuar',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: _buttonEnabled ? _nextStep : null,
              textColor: Colors.white,
              color: Colors.blue,
              disabledColor: Colors.grey,
            ),
          ],
        ),
      ),
    ));
  }
}
