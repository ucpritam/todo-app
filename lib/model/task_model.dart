class Task {
  int? id;
  final String title;
  bool status;

  //constructor
  Task({this.id, required this.title, required this.status});

  //Converting data into map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'status': status ? 1 : 0,
    };
  }

  //debugging
  @override
  String toString() {
    return 'Task(id: $id, title: $title, status: $status)';
  }

  // factory Task.fromMap(Map<String, dynamic> map) {
  //   return Task(
  //     id: map["id"],
  //     title: map["title"],
  //     status: map["status"],
  //   );
  // }
}
