import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class SettingsTabs extends StatelessWidget {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLinePicker(
      focusedDate: _selectedDate,
      firstDate: DateTime(2024, 3, 18),
      lastDate: DateTime(2030, 3, 18),
      onDateChange: (date) {
        _selectedDate = date;
      },
      selectionMode: SelectionMode.alwaysFirst(),
    );
  }
}
