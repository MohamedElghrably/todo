import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_models.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModels> getTasksCollection() =>
      FirebaseFirestore.instance
          .collection("tasks")
          .withConverter<TaskModels>(
            fromFirestore:
                (snapshot, _) => TaskModels.fromJson(snapshot.data()!),
            toFirestore: (taskmodel, options) => taskmodel.toJson(),
          );

  static Future<void> addTaskToFirestore(TaskModels task) {
    CollectionReference<TaskModels> collection = getTasksCollection();
    DocumentReference<TaskModels> doc =
        collection.doc(); // create a new document
    task.id = doc.id;
    return doc.set(task);
  }
  static Future<void> deleteTaskFromFirestore(String taskId) {
    CollectionReference<TaskModels> collection = getTasksCollection();
    return collection.doc(taskId).delete(); // delete the task by id
  }

  static Future<List<TaskModels>> getAllTasksFromFirebase() async {
    CollectionReference<TaskModels> collection = getTasksCollection();
    QuerySnapshot<TaskModels> querySnapshot = await collection.get();
    return querySnapshot.docs
        .map((docsnapshot) => docsnapshot.data())
        .toList(); // get all tasks
  }
}
