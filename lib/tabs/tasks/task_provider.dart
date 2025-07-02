import 'package:flutter/material.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_models.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModels> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getTasks() async {
    tasks =
        await FirebaseFunctions.getAllTasksFromFirebase(); // get tasks from firebase
    tasks = tasks.where((task) =>
        task.date.year == selectedDate.year &&
        task.date.month == selectedDate.month &&
        task.date.day == selectedDate.day).toList(); // filter tasks by date
    notifyListeners();
  }

  changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
  Future<void> deleteTask(String taskId) async {
    await FirebaseFunctions.deleteTaskFromFirestore(taskId);
    notifyListeners();
  }
}
