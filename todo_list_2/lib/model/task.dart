

class Task {
  int id;
  String description;
  String dueDate;
  String dueTime;
  int isDone;

  Task(this.id, this.description, this.dueDate, this.dueTime, this.isDone);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'date': dueDate,
      'time': dueTime,
      'isDone': isDone,
    };
  }
//  Task getById(String id) {
//    return _toDoList.firstWhere((task) => task.id == id);
//  }

//  void createNewTask(Task task) {
//    final newTask = Task(
//      id: task.id,
//      description: task.description,
//      dueDate: task.dueDate,
//      dueTime: task.dueTime,
//    );
//    _toDoList.add(newTask);
//    notifyListeners();
//  }

//  void editTask(Task task) {
//    removeTask(task.id);
//    createNewTask(task);
//  }

//  void removeTask(String id) {
//    _toDoList.removeWhere((task) => task.id == id);
//    notifyListeners();
//  }
//
//  void changeStatus(String id) {
//    int index = _toDoList.indexWhere((task) => task.id == id);
//    _toDoList[index].isDone = !_toDoList[index].isDone;
//    //print('PROVIDER ${_toDoList[index].isDone.toString()}');
//  }
}
