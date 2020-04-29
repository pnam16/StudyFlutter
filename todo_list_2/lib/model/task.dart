class Task {
  String id;
  String description;
  String dueDate;
  String dueTime;

  Task(this.id, this.description, this.dueDate, this.dueTime);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'date': dueDate,
      'time': dueTime,
    };
  }
}
