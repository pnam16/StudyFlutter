import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_2/bloc/task_bloc.dart';
import 'package:todo_list_2/event/add_task_event.dart';
import 'package:todo_list_2/event/delete_task_event.dart';
import 'package:todo_list_2/model/task.dart';

class ModalScreen extends StatefulWidget {
  String id;
  bool isEditMode;

  ModalScreen(this.id, this.isEditMode);

  @override
  State<StatefulWidget> createState() => ModalScreenState();
}

class ModalScreenState extends State<ModalScreen> {
  TimeOfDay _selectedTime;
  DateTime _selectedDate;
  String _inputDescription;

  @override
  Widget build(BuildContext context) {
//    var bloc = Provider.of<TaskBloc>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Title",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 22)),
          TextFormField(
            initialValue: _inputDescription == null ? null : _inputDescription,
            decoration: InputDecoration(
              hintText: 'Describe your task',
            ),
            onChanged: (value) {
              _inputDescription = value;
            },
          ),
          SizedBox(height: 20),
          Text("Date",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 22)),
          TextFormField(
            onTap: () {
              _pickDueDate();
            },
            readOnly: true,
            decoration: InputDecoration(
              hintText: _selectedDate == null
                  ? 'Provide date'
                  : DateFormat.yMMMd().format(_selectedDate).toString(),
            ),
          ),
          SizedBox(height: 20),
          Text("Time",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 22)),
          TextFormField(
            onTap: () {
              _pickDueTime();
            },
            readOnly: true,
            decoration: InputDecoration(
              hintText: _selectedTime == null
                  ? 'Provide time'
                  : _selectedTime.format(context),
            ),
          ),
          SizedBox(height: 22),
          Container(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.black54),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: FlatButton(
                child: Text(
                  !widget.isEditMode ? 'Add task' : 'Edit Task',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _savePressed(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _pickDueDate() {
    showDatePicker(
            context: context,
//            initialDate: widget.isEditMode ? _selectedDate : DateTime.now(),
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030))
        .then((date) {
      if (date == null) {
        return;
      }
      date = date;
      setState(() {
        _selectedDate = date;
      });
    });
  }

  void _pickDueTime() {
    showTimePicker(
      context: context,
//      initialTime: widget.isEditMode ? _selectedTime : TimeOfDay.now(),
      initialTime: TimeOfDay.now(),
    ).then((time) {
      if (time == null) {
        return;
      }
      setState(() {
        _selectedTime = time;
      });
    });
  }

  void _savePressed(BuildContext context) {
    if (_inputDescription == null) return;
    Task task = Task(
        widget.id,
        _inputDescription,
        DateFormat.yMMMd().format(_selectedDate).toString(),
        _selectedTime.format(context));
    Provider.of<TaskBloc>(context, listen: false).event.add(AddTaskEvent(task));
    Navigator.of(context).pop();
  }
}
