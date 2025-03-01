import 'package:flutter/material.dart';
import 'package:v_library/model/live_class.dart';

class UpdatedScheduleUI extends StatelessWidget {
  final LiveClass updatedClass;

  const UpdatedScheduleUI({super.key, required this.updatedClass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Updated Schedule", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Start Date: ${updatedClass.startDate}"),
          Text("End Date: ${updatedClass.endDate}"),
          Text("Sessions:", style: TextStyle(fontWeight: FontWeight.bold)),
          ...updatedClass.sessions.map((session) => Text(
              "${session.date}: ${session.startTime} - ${session.endTime}")),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Back"),
          ),
        ],
      ),
    );
  }
}