import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/task_models.dart';

class TaskItem extends StatelessWidget {
  TaskModels task;
  TaskItem({required this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),

      child: Row(
        children: [
          Container(
            height: 62,
            width: 4,
            margin: EdgeInsetsDirectional.only(start: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Text(
                  task.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Text(
                  task.description,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 34,
            width: 69,
            margin: EdgeInsetsDirectional.only(start: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.check, size: 32, color: AppTheme.white),
          ),
        ],
      ),
    );
  }
}
