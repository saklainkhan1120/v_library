import 'package:flutter/material.dart';
import 'package:v_library/core/features/home/presentation/screens/record_course/course_create/step_1_screen2.dart';
import 'package:v_library/core/utils/colors.dart';

class RecordStepOneScreen extends StatefulWidget {
  const RecordStepOneScreen({super.key});

  @override
  _RecordStepOneScreenState createState() => _RecordStepOneScreenState();
}

class _RecordStepOneScreenState extends State<RecordStepOneScreen> {
  int currentStep = 1;
  String selectedCourseType = "Lecture/Class";
  String selectedType = "Recorded";
  List<String> selectedRoles = []; // For multi-selection
  TextEditingController textController =
      TextEditingController(); // For text field
  bool isActive = false; // For Active toggle
  bool isReactive = false; // For Reactive toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 6,
        leading: Container(
          height: 45,
          width: 45,
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: backGroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'Hi, Smriti',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/bell.png', width: 24, height: 24),
            onPressed: () {},
          ),
          // const SizedBox(width: 4), // Reduced gap between icons
          IconButton(
            icon: Image.asset('assets/icons/mail.png', width: 24, height: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 8), // Reduced gap
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message, color: Colors.black),
              title: Text('Messages', style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.black),
              title: Text('Profile', style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text('Settings', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Step 1:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Basic Info", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildStepper(),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Course Type",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: _buildSelectableOptions(
                              ["Lecture/Class", "Certificate Course"],
                              selectedCourseType, (val) {
                            setState(() {
                              selectedCourseType = val;
                            });
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Type",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: _buildSelectableOptions(
                              ["Recorded", "Live", "Both"], selectedType,
                              (val) {
                            setState(() {
                              selectedType = val;
                            });
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Text Field with Title
              const Text(
                "Course Language",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Creator can add a lang here",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: primaryColorCode),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Role",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: _buildMultiSelectableOptions(
                    ["Guide", "Teacher", "Guru", "Mentor", "Faculty"],
                    selectedRoles, (val) {
                  setState(() {
                    if (selectedRoles.contains(val)) {
                      selectedRoles.remove(val); // Deselect
                    } else {
                      selectedRoles.add(val); // Select
                    }
                  });
                }),
              ),
              const SizedBox(height: 20),
              // Active/Reactive Toggle Switches
              Row(
                children: [
                  const Text(
                    "Auto create course_bloc group",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Switch(
                    value: isActive,
                    onChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    },
                    activeColor: primaryColorCode,
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     const Text(
              //       "Reactive",
              //       style: TextStyle(fontSize: 16),
              //     ),
              //     const Spacer(),
              //     Switch(
              //       value: isReactive,
              //       onChanged: (value) {
              //         setState(() {
              //           isReactive = value;
              //         });
              //       },
              //       activeColor: primaryColorCode,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              // Back Icon and Next Button
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: backGroundColor, // Grey background
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.grey),
                      onPressed: () {
                        // Back button functionality
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordStepOneScreentwo()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColorCode,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Slightly rounded
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 16, color: color_E4DFDF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      children: List.generate(5, (index) {
        return Expanded(
          child: Row(
            children: [
              // Box
              Container(
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  color: index + 1 == currentStep
                      ? primaryColorCode
                      : Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: index + 1 == currentStep
                        ? primaryColorCode
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      color: index + 1 == currentStep
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              // Line between boxes
              if (index != 4) ...[
                Expanded(
                  child: Container(
                    height: 2,
                    color: index + 1 < currentStep
                        ? primaryColorCode
                        : Colors.grey.shade300,
                  ),
                ),
              ],
            ],
          ),
        );
      }),
    );
  }

  List<Widget> _buildSelectableOptions(
      List<String> options, String selectedValue, Function(String) onSelect) {
    return options.map((option) {
      bool isSelected = option == selectedValue;
      return ChoiceChip(
        label: Text(option),
        selected: isSelected,
        selectedColor: primaryColorCode,
        onSelected: (selected) => onSelect(option),
      );
    }).toList();
  }

  List<Widget> _buildMultiSelectableOptions(List<String> options,
      List<String> selectedValues, Function(String) onSelect) {
    return options.map((option) {
      bool isSelected = selectedValues.contains(option);
      return ChoiceChip(
        label: Text(option),
        selected: isSelected,
        selectedColor: primaryColorCode,
        onSelected: (selected) => onSelect(option),
      );
    }).toList();
  }
}
