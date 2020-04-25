import 'package:flutter/material.dart';
import 'package:todo_list_2/screens/modal_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: <Widget>[],
      ),
      body: Text('a'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
//            builder: (_) => TaskScreen(isEditMode: false),
            builder: (_) => ModalScreen(),
          );
        },
        tooltip: 'Add a new item!',
      ),
    );
  }
}
