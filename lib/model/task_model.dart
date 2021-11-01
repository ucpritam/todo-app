class Task {
  String id;
  final String title;
  bool status;

  //constructor
  Task({required this.id, required this.title, this.status = false});

  //Converting data into map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'status': status ? true : false,
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
