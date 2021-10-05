import 'package:flutter/material.dart';
import 'package:todo_app/database/db_provider.dart';
import 'package:todo_app/model/task_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final Function updateTaskList;
  final Task task;
  HomePage({required Key key, this.updateTaskList, this.task});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Task>> _taskList;
  final _formKey = GlobalKey<FormState>();
  String _title = "";

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _title = widget.task.title;
    }

    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DBProvider.instance.getTaskList();
    });
  }

  _addToDo() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Task task = Task(title: _title);
      if (widget.task == null) {
        task.status = 0;
        DBProvider.instance.insertTask(task);
      } else {
        task.id = widget.task.id;
        task.status = widget.task.status;
      }
      widget.updateTaskList();
    }
  }

  Widget _buildTasks(Task task) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        title: Text(
          "${task.title}",
          style: TextStyle(
            fontSize: 20,
            decoration: task.status == 0
                ? TextDecoration.none
                : TextDecoration.lineThrough,
          ),
        ),
        trailing: Checkbox(
          onChanged: (value) {
            task.status = value ? 1 : 0;
            DBProvider.instance.updateTask(task);
            _updateTaskList();
          },
          value: task.status == 1 ? true : false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: _taskList,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: 1 + snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                    );
                  }
                  return _buildTasks(snapshot.data[index - 1]);
                },
              );
            },
          )),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 18),
                        decoration: const InputDecoration(
                          hintText: 'Add task',
                          border: OutlineInputBorder(),
                        ),
                        validator: (input) => input.trim().isEmpty
                            ? "Please enter a Task Title"
                            : null,
                        onSaved: (input) => _title = input,
                        initialValue: _title,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _addToDo,
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
