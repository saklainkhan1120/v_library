import 'package:flutter/material.dart';

class Step1Screen extends StatefulWidget {
  @override
  _Step1ScreenState createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  String? selectedCourseType = "Lecture/Class";
  String? selectedType = "Recorded";
  String? selectedRole = "Guide";
  bool autoCreateCourseGroup = true;
  bool isRSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Hi, Smriti"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) => CircleAvatar(
                  radius: 16,
                  backgroundColor:
                      index == 0 ? Colors.orange : Colors.grey[300],
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      color: index == 0 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Step 1: Basic Info",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Course Type
            Text("Course type"),
            Wrap(
              spacing: 8.0,
              children: ["Lecture/Class", "Certificate Course"].map((type) {
                return ChoiceChip(
                  label: Text(type),
                  selected: selectedCourseType == type,
                  selectedColor: Colors.orange,
                  onSelected: (selected) {
                    setState(() {
                      selectedCourseType = type;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Type
            Text("Type"),
            Wrap(
              spacing: 8.0,
              children: ["Recorded", "Live", "Both"].map((type) {
                return ChoiceChip(
                  label: Text(type),
                  selected: selectedType == type,
                  selectedColor: Colors.orange,
                  onSelected: (selected) {
                    setState(() {
                      selectedType = type;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Course Language
            Text("Course language"),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Creator can add a lang here",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Role
            Text("Your role"),
            Wrap(
              spacing: 8.0,
              children:
                  ["Guide", "Teacher", "Guru", "Mentor", "Faculty"].map((role) {
                return ChoiceChip(
                  label: Text(role),
                  selected: selectedRole == role,
                  selectedColor: Colors.orange,
                  onSelected: (selected) {
                    setState(() {
                      selectedRole = role;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Auto Create Course Group
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Auto create course group"),
                Switch(
                  value: autoCreateCourseGroup,
                  onChanged: (value) {
                    setState(() {
                      autoCreateCourseGroup = value;
                    });
                  },
                ),
              ],
            ),

            // R Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("R"),
                Switch(
                  value: isRSelected,
                  onChanged: (value) {
                    setState(() {
                      isRSelected = value;
                    });
                  },
                ),
              ],
            ),

            Spacer(),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Step 2
                },
                child: Text("Next"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
