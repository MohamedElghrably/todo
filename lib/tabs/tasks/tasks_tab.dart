import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/tasks/task_item.dart';
import 'package:todo/tabs/tasks/task_provider.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime _focusDate = DateTime.now();
  bool getTaskListFlag = true;
  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    if (getTaskListFlag) {
      // because not entering inifinite loop of setstate
      taskProvider.getTasks();
      getTaskListFlag = false;
    }
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .19,
              width: double.infinity,
              decoration: BoxDecoration(color: AppTheme.primary),
            ),
            PositionedDirectional(
              start: 20,
              child: SafeArea(
                child: Text(
                  "ToDo List",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * .14,
              ),
              child: EasyInfiniteDateTimeLine(
                // controller: _controller,
                selectionMode: SelectionMode.alwaysFirst(),
                activeColor: AppTheme.white,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                focusDate: taskProvider.selectedDate,
                lastDate: DateTime.now().add(Duration(days: 365)),
                showTimelineHeader: false,
                dayProps: EasyDayProps(
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppTheme.white,
                    ),
                    dayNumStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                    dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                    monthStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppTheme.white,
                    ),
                    dayNumStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.dark,
                    ),
                    dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.dark,
                    ),
                  ),
                  todayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppTheme.white,
                    ),
                    dayNumStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.dark,
                    ),
                    dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.dark,
                    ),
                  ),
                ),
                onDateChange:
                    (selectedDate) => {taskProvider.changeDate(selectedDate)},
              ),
            ),
          ],
        ),

        Expanded(
          child: ListView.builder(
            itemBuilder:
                (context, index) => TaskItem(task: taskProvider.tasks[index]),
            itemCount: taskProvider.tasks.length,
          ),
        ),
      ],
    );
  }
}
