import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/app_drop_down.dart';
import 'package:v_library/core/features/home/presentation/screens/live_course/course_create/step_3_screen.dart';
import 'package:v_library/core/features/home/presentation/screens/seller_mobile/seller_create_step3_screen.dart';
import 'package:v_library/core/utils/colors.dart';

class SellerCreateStep2Screen extends StatefulWidget {
  const SellerCreateStep2Screen({super.key});

  @override
  _SellerCreateStep2ScreenState createState() => _SellerCreateStep2ScreenState();
}

class _SellerCreateStep2ScreenState extends State<SellerCreateStep2Screen> {
  int currentStep = 2; // Step 2 is active
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController textController = TextEditingController();
  String? selectedNumberOfLectures; // For No. of live lectures dropdown
  String? selectedFrequency; // For Frequency of classes dropdown
  bool isSwitchEnabled = false; // For toggle switch

  String selectedParticipant = 'Select a option';
  bool isActive = true;

  void _showCreateLiveSessionForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Details', textAlign: TextAlign.left),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Start Date and End Date Row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Start Date",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: startDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Select start date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primaryColorCode),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      selectedStartDate = picked;
                                      startDateController.text =
                                          "${picked.day}/${picked.month}/${picked.year}";
                                    });
                                  }
                                },
                              ),
                            ),
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
                            "End Date",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: endDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Select end date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primaryColorCode),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      selectedEndDate = picked;
                                      endDateController.text =
                                          "${picked.day}/${picked.month}/${picked.year}";
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Start Time and End Time Row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Start Time",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: startTimeController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Select start time",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primaryColorCode),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.access_time),
                                onPressed: () async {
                                  final TimeOfDay? picked =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      selectedStartTime = picked;
                                      startTimeController.text =
                                          "${picked.hour}:${picked.minute}";
                                    });
                                  }
                                },
                              ),
                            ),
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
                            "End Time",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: endTimeController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Select end time",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primaryColorCode),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.access_time),
                                onPressed: () async {
                                  final TimeOfDay? picked =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      selectedEndTime = picked;
                                      endTimeController.text =
                                          "${picked.hour}:${picked.minute}";
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Column for 3 Text Fields
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. No. of live lectures
                    const Text(
                      "No. of live lectures",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: "1 to 100",
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
                      value: selectedNumberOfLectures,
                      items:
                          List.generate(100, (index) => (index + 1).toString())
                              .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedNumberOfLectures = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // 2. Frequency of classes
                    const Text(
                      "Frequency of classes",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: "Options here",
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
                      value: selectedFrequency,
                      items: ["Daily", "Weekly", "Monthly"].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedFrequency = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // 3. Toggle Switch with Text Field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Custom frequency",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          value: isSwitchEnabled,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitchEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "One class in every (days)",
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
                  ],
                ),
                const SizedBox(height: 20),

                // Done Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
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
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
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
                    Text("Room setting", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildStepper(),
              const SizedBox(height: 20),
              const Text(
                "Participant limit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              AppDropDown(
                  value: selectedParticipant,
                  hint: "Select a option", items: ["Select a option", "1", "2", "3", "4"].map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Container(margin: const EdgeInsets.only(left: 10),
                      child: Text(e)),
                );
              }).toList(),
                  onChanged: (val){
                    selectedParticipant = val!;
                    setState(() {});
                  }),
              SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Allow participant to chat",
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
                    activeColor: color_615BC9,
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Text(
                "Room rules",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: textController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Add rules",
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
              SizedBox(height: 20),
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
                      builder: (context) => SellerCreateStep3Screen()),
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
      children: List.generate(4, (index) {
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
}
