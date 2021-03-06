import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart'; //new

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Initially password is obscure

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: 
           Container(
            padding: const EdgeInsets.all(28.0),
            
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    "KITTY MINGSI",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 44.0,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Expanded(
                    child: Icon(
                      IconData(0xe3ea, fontFamily: 'MaterialIcons'),
                      size: 120.0,
                      color: Colors.blue,
                    ),
                    flex: 1,
                  ),
                  Expanded(flex: 3, child: LoginForm()),
                ]),
          ),
        );
  }
}

class LoginForm extends StatefulWidget {
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 18.0),
          icon: Icon(
            FontAwesomeIcons.envelope,
            color: Colors.blue,
          ),
          labelText: "E-mail address",
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.blue, width: 1.0, style: BorderStyle.solid),
          )),
    );

    final password = TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      autofocus: false,
      obscureText: _obscureText,
      decoration: InputDecoration(
          icon: Icon(
            FontAwesomeIcons.lock,
            color: Colors.blue,
          ),
          labelText: "Password",
          hintText: "****",
          suffixIcon: GestureDetector(
              onTap: _toggle,
              child: Icon(
                _obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                size: 20.0,
              )),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.blue, width: 1.0, style: BorderStyle.solid),
          )),
    );

    final loginButton = Container( 
        child: Theme.of(context).platform == TargetPlatform.iOS
            ? CupertinoButton(
                color: Colors.blue,
                disabledColor: Colors.yellow,
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Submit button pressed')));
                },
                child: Container(
                    child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                )))
            : MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Submit button pressed')));
                },
                child: Container(
                    child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ))));

    return Container(
        child: ListView(children: [
      Text("Login",
          style: TextStyle(
              color: Colors.blue, fontSize: 22.0, fontWeight: FontWeight.bold)),
      SizedBox(height: 16.0),
      email,
      SizedBox(height: 16.0),
      password,
      SizedBox(
        height: 28.0,
      ),
      loginButton,
      SizedBox(
        height: 12.0,
      ),
      Container(
          child: Theme.of(context).platform == TargetPlatform.iOS
              ? CupertinoButton(
                  color: Colors.white,
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Register button pressed')));
                  },
                  child: Container(
                      child: Text(
                    'Register',
                    style: TextStyle(color: Colors.blue, fontSize: 18.0),
                  )))
              : FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Register button pressed')));
                  },
                  child: Container(
                      child: Text(
                    'Register',
                    style: TextStyle(color: Colors.blue, fontSize: 18.0),
                  ))))
    ]));
  }
}
