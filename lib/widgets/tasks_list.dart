import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, tasksData, child) {
        return ListView.builder(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
          itemBuilder: (context, index) {
            final task = tasksData.tasks[index];
            return TaskTile(task);
          },
          itemCount: tasksData.tasksCount,
        );
      },
    );
  }
}
