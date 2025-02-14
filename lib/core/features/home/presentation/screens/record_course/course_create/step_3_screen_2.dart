import 'package:flutter/material.dart';
import 'package:v_library/core/features/home/presentation/screens/live_course/course_create/step_4_screen.dart';
import 'package:v_library/core/utils/colors.dart';

class RecordStepThreeScreenrtwo extends StatefulWidget {
  const RecordStepThreeScreenrtwo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StepThreeScreenrtwoState createState() => _StepThreeScreenrtwoState();
}

class _StepThreeScreenrtwoState extends State<RecordStepThreeScreenrtwo> {
  int currentStep = 3; // Step 3 is active
  bool isCloudOnlineSaleEnabled = false; // Switch for "Cloud/online sale"
  bool isDataValidityEnabled = false; // Switch for "Data validity"
  bool isPendriveSaleEnabled = false; // Switch for "Pendrive sale"
  bool isPendriveValidityEnabled = false;
  bool isHardCopyEnabled = false; // Switch for "Pendrive validity"
  DateTime? selectedDataValidityDate; // Selected date for "Data validity"
  DateTime?
      selectedPendriveValidityDate; // Selected date for "Pendrive validity"
  TextEditingController dataValidityController =
      TextEditingController(); // Controller for data validity

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
                    Text("Step 3:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Mode of Delivery", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildStepper(),
              const SizedBox(height: 20),

              // Cloud/online sale Row with Switch
              Row(
                children: [
                  const Text(
                    "Kindle view of book (paid)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.8, // Reduce switch size
                    child: Switch(
                      value: isCloudOnlineSaleEnabled,
                      onChanged: (value) {
                        setState(() {
                          isCloudOnlineSaleEnabled = value;
                        });
                      },
                      activeColor: const Color(0xFF2D68FE), // Hex #2D68FE
                    ),
                  ),
                ],
              ),

              // Data validity Text Field with Switch

              // Cloud/online link Text Field
              const Text(
                "Kindle view link",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: dataValidityController,
                decoration: InputDecoration(
                  hintText: "ex: drive.google.com",
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

              // Pendrive sale Row with Switch
              Row(
                children: [
                  const Text(
                    "Print of book (paid)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.8, // Reduce switch size
                    child: Switch(
                      value: isPendriveSaleEnabled,
                      onChanged: (value) {
                        setState(() {
                          isPendriveSaleEnabled = value;
                        });
                      },
                      activeColor: const Color(0xFF2D68FE), // Hex #2D68FE
                    ),
                  ),
                ],
              ),
              const Text(
                "Print book PDF link",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: dataValidityController,
                decoration: InputDecoration(
                  hintText: "ex: drive.google.com",
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
              // Pendrive validity Text Field with Switch
              Row(
                children: [
                  const Text(
                    "Original hardcopy of book",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.8, // Reduce switch size
                    child: Switch(
                      value: isHardCopyEnabled,
                      onChanged: (value) {
                        setState(() {
                          isHardCopyEnabled = value;
                        });
                      },
                      activeColor: const Color(0xFF2D68FE), // Hex #2D68FE
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),

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
                            builder: (context) => StepFourScreen()),
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
}
