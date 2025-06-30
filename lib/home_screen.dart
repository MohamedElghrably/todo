import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/settings/settings_tabs.dart';
import 'package:todo/tabs/tasks/add_tasks_bottom_sheet.dart';
import 'package:todo/tabs/tasks/tasks_tab.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [TasksTab(), SettingsTabs()];
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: AppTheme.white,
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentTabIndex,
          onTap:
              (index) => setState(() {
                currentTabIndex = index;
              }),
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "tasks"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "settings",
            ),
          ],
        ),
      ),
      body: tabs[currentTabIndex],
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => showModalBottomSheet(
              context: context,
              builder: (context) => AddTasksBottomSheet(),
            ),
        child: Icon(Icons.add, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
