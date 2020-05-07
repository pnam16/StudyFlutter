import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPageState extends State<LoginPage> {
  final TextField _txtUserName = TextField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
        hintText: "Your user name",
        contentPadding: EdgeInsets.all(10.0),
        border: InputBorder.none),
    autocorrect: false,
  );
  final TextField _txtEmail = TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
        hintText: "Your email",
        contentPadding: EdgeInsets.all(10.0),
        border: InputBorder.none),
    autocorrect: false,
  );
  final TextField _txtPassword = TextField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
        hintText: "Your password",
        contentPadding: EdgeInsets.all(10.0),
        border: InputBorder.none),
    autocorrect: false,
    obscureText: true, //che mk
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page ex"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                border: Border.all(width: 1.2, color: Colors.black45),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: _txtUserName,
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                border: Border.all(width: 1.2, color: Colors.black45),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: _txtEmail,
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                border: Border.all(width: 1.2, color: Colors.black45),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: _txtPassword,
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    //match-parent
                    child: RaisedButton(
                        child: Text("Login", style: TextStyle(fontSize: 20.0)),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}
