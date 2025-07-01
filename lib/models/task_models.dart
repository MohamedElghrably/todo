import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModels {
  String id;
  String title;
  String description;
  DateTime date;
  bool isDone;
  TaskModels({
    this.id = '',
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });
  TaskModels.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: (json['date'] as Timestamp).toDate(), // convert timestamp to date
        isDone: json['isDone'],
      ); // convert json to task model

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'date': Timestamp.fromDate(date),
    'isDone': isDone,
  }; // convert to json
}
