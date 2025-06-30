import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/tabs/tasks/task_provider.dart';
import 'package:todo/widgets/default_elevated_button.dart';
import 'package:todo/widgets/default_text_form_field.dart';

class AddTasksBottomSheet extends StatefulWidget {
  @override
  State<AddTasksBottomSheet> createState() => _AddTasksBottomSheetState();
}

class _AddTasksBottomSheetState extends State<AddTasksBottomSheet> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .44,
      padding: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add you task",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            DefaultTextFormField(
              controller: titlecontroller,
              hintText: "Enter task tilte",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter the title";
                }
              },
            ),
            SizedBox(height: 16),
            DefaultTextFormField(
              controller: descriptioncontroller,
              hintText: "Enter task description",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter the Description";
                }
              },
            ),
            SizedBox(height: 16),
            Text(
              "select date",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () async {
                DateTime? dateTime = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 356)),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: selectedDate,
                  barrierColor: AppTheme.primary,
                );
                if (dateTime != null && selectedDate != dateTime) {
                  selectedDate = dateTime;
                  setState(() {});
                }
              },
              child: Text(
                dateFormat.format(selectedDate),
                textAlign: TextAlign.center,
              ),
            ),
            DefaultElevatedButton(
              label: "Add",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  addtask();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void addtask() {
    TaskModels task = TaskModels(
      title: titlecontroller.text,
      description: descriptioncontroller.text,
      date: selectedDate,
    );
    FirebaseFunctions.addTaskToFirestore(task).timeout(
      Duration(microseconds: 100),
      onTimeout: () {
        Navigator.pop(context);
        Provider.of<TaskProvider>(context, listen: false).getTasks();
      },
    );
  }
}
