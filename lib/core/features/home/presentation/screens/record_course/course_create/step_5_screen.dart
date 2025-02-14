import 'package:flutter/material.dart';
import 'package:v_library/core/utils/colors.dart';

class RecordStepFiveScreen extends StatefulWidget {
  const RecordStepFiveScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StepFiveScreenState createState() => _StepFiveScreenState();
}

class _StepFiveScreenState extends State<RecordStepFiveScreen> {
  int currentStep = 5; // Step 5 is active
  bool isFlyerEnabled = false; // Switch for "Flyer design"
  bool isFileAttachEnabled = false; // Switch for "File attachment"
  bool isCheckbox1Checked = false; // Checkbox 1
  bool isCheckbox2Checked = false; // Checkbox 2

  // Dummy list of flyer image URLs (replace with your actual image URLs)
  final List<String> flyerImageUrls = [
    "https://via.placeholder.com/150x100",
    "https://via.placeholder.com/150x100",
    "https://via.placeholder.com/150x100",
    "https://via.placeholder.com/150x100",
    "https://via.placeholder.com/150x100",
  ];

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
                    Text("Step 5:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Preview and publish", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildStepper(),
              const SizedBox(height: 20),

              // Flyer Design Section
              Row(
                children: [
                  const Text(
                    "Flyer design",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.8, // Reduce switch size
                    child: Switch(
                      value: isFlyerEnabled,
                      onChanged: (value) {
                        setState(() {
                          isFlyerEnabled = value;
                        });
                      },
                      activeColor: const Color(0xFF2D68FE), // Hex #2D68FE
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Flyer Images in a Horizontal Scrollable Row
              if (isFlyerEnabled)
                SizedBox(
                  height: 120, // Height of the flyer image row
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: flyerImageUrls.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            flyerImageUrls[index],
                            width: 100, // Width of each flyer image
                            height: 100, // Height of each flyer image
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (isFlyerEnabled)
                const Text(
                  "Select a design for flyer",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              const SizedBox(height: 20),

              // File Attachment Section
              Row(
                children: [
                  const Text(
                    "Attach file",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.8, // Reduce switch size
                    child: Switch(
                      value: isFileAttachEnabled,
                      onChanged: (value) {
                        setState(() {
                          isFileAttachEnabled = value;
                        });
                      },
                      activeColor: const Color(0xFF2D68FE), // Hex #2D68FE
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // File Attachment Text Field
              if (isFileAttachEnabled)
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Choose file",
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
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: () {
                        // File attachment functionality
                      },
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // Checkbox Section
              if (isFileAttachEnabled)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isCheckbox1Checked,
                          onChanged: (value) {
                            setState(() {
                              isCheckbox1Checked = value ?? false;
                            });
                          },
                          activeColor: const Color(0xFF2D68FE), // Hex #2D68FE
                        ),
                        const Text(
                          "I agree to the terms and conditions",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isCheckbox2Checked,
                          onChanged: (value) {
                            setState(() {
                              isCheckbox2Checked = value ?? false;
                            });
                          },
                          activeColor: const Color(0xFF2D68FE), // Hex #2D68FE
                        ),
                        const Text(
                          "I confirm that the file is accurate",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              const SizedBox(height: 20),

              // Preview and Publish Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Preview button functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "Preview",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Publish button functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColorCode,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "Publish",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
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
