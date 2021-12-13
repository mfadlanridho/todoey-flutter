import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/tasks_data.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Consumer<TasksData>(
        builder: (context, tasksData, child) {
          return ListTile(
            onLongPress: () {
              tasksData.deleteTask(task);
            },
            title: Text(
              task.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (bool? value) {
                tasksData.updateTask(task);
              },
              activeColor: Colors.lightBlueAccent,
            ),
          );
        },
      ),
    );
  }
}
