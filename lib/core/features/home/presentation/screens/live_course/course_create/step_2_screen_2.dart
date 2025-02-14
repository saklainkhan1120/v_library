import 'package:flutter/material.dart';
import 'package:v_library/core/features/home/presentation/screens/live_course/course_create/step_1_screen.dart';
import 'package:v_library/core/features/home/presentation/screens/live_course/course_create/step_3_screen.dart';
import 'package:v_library/core/utils/colors.dart';

class StepTwoScreenTwo extends StatefulWidget {
  const StepTwoScreenTwo({super.key});

  @override
  _StepTwoScreenTwoState createState() => _StepTwoScreenTwoState();
}

class _StepTwoScreenTwoState extends State<StepTwoScreenTwo> {
  int currentStep = 2; // Step 2 is active
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  int numberOfLectures = 1;
  String? frequency;
  int customFrequencyDays = 1;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

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
          IconButton(
            icon: Image.asset('assets/icons/mail.png', width: 24, height: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
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
                    Text("Step 2:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Create classes", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildStepper(),
              const SizedBox(height: 20),
              _buildDateAndTimeFields(),
              const SizedBox(height: 20),
              _buildNumberOfLecturesField(),
              const SizedBox(height: 20),
              _buildFrequencyField(),
              const SizedBox(height: 20),
              _buildCustomFrequencyField(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiveStepOneScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColorCode,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    const Text(
                      'Create Live Session',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backGroundColor,
                borderRadius: BorderRadius.circular(8),
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
                icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LiveStepThreeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColorCode,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 16, color: color_E4DFDF),
              ),
            ),
          ],
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

  Widget _buildDateAndTimeFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Start date    End Date",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => _selectDate(context, true),
                child: Text(
                  startDate != null
                      ? "${startDate!.toLocal()}".split(' ')[0]
                      : 'Select',
                  style: TextStyle(
                    color: startDate != null ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () => _selectDate(context, false),
                child: Text(
                  endDate != null
                      ? "${endDate!.toLocal()}".split(' ')[0]
                      : 'Select',
                  style: TextStyle(
                    color: endDate != null ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text("Start time    End time",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => _selectTime(context, true),
                child: Text(
                  startTime != null ? startTime!.format(context) : 'Select',
                  style: TextStyle(
                    color: startTime != null ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () => _selectTime(context, false),
                child: Text(
                  endTime != null ? endTime!.format(context) : 'Select',
                  style: TextStyle(
                    color: endTime != null ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberOfLecturesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("No. of live lectures",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        DropdownButton<int>(
          value: numberOfLectures,
          onChanged: (int? newValue) {
            setState(() {
              numberOfLectures = newValue!;
            });
          },
          items: List<DropdownMenuItem<int>>.generate(
            100,
            (index) => DropdownMenuItem<int>(
              value: index + 1,
              child: Text('${index + 1}'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFrequencyField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Frequency of classes",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: frequency,
          onChanged: (String? newValue) {
            setState(() {
              frequency = newValue;
            });
          },
          items: <String>['Daily', 'Weekly', 'Monthly'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCustomFrequencyField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Custom frequency",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          children: [
            const Text("One class in every"),
            SizedBox(width: 10),
            DropdownButton<int>(
              value: customFrequencyDays,
              onChanged: (int? newValue) {
                setState(() {
                  customFrequencyDays = newValue!;
                });
              },
              items: List<DropdownMenuItem<int>>.generate(
                30,
                (index) => DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text('${index + 1} days'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
