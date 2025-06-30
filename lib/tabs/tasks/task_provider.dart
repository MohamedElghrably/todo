import 'package:flutter/material.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_models.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModels> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getTasks() async {
    tasks =
        await FirebaseFunctions.getAllTasksFromFirebase(); // get tasks from firebase
    notifyListeners();
  }

  changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
