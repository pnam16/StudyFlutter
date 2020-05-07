import 'package:flutter/material.dart';

class MainPageState extends State<MainPage> {
  var title = '';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Drawer in Flutter")),
        body: Center(
          child: Text(this.title, style: TextStyle(fontSize: 25.0)),
        ),
        drawer: _builDrawer(context));
  }

  Drawer _builDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Hi hihihi",
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.photo,
              size: 30.0,
            ),
            title: Text(
              "Photo",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              setState(() {
                this.title = 'Photo Page';
              });
              Navigator.pop(context); //thu Drawer sau khi bam
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              size: 30.0,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              setState(() {
                this.title = "This is Notifications page";
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30.0,
            ),
            title: Text(
              "Setting",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: 16.0,
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              size: 30.0,
            ),
            title: Text(
              "About me",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.assistant_photo,
              size: 30.0,
            ),
            title: Text(
              "Privacy",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}
