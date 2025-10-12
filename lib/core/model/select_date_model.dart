import 'package:flutter/material.dart';

class SelectedDataModel {
  final String date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  SelectedDataModel({
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory SelectedDataModel.empty() {
    return SelectedDataModel(
      date: "",
      startTime: const TimeOfDay(hour: 0, minute: 0),
      endTime: const TimeOfDay(hour: 0, minute: 0),
    );
  }
}