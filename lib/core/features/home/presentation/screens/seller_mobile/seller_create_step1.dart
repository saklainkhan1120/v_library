import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/app_drop_down.dart';
import 'package:v_library/core/features/home/presentation/screens/seller_mobile/seller_create_step2.dart';
import 'package:v_library/core/utils/colors.dart';

class SellerCreateStep1Screen extends StatefulWidget {
  const SellerCreateStep1Screen({super.key});

  @override
  _SellerCreateStep1ScreenState createState() => _SellerCreateStep1ScreenState();
}

class _SellerCreateStep1ScreenState extends State<SellerCreateStep1Screen> {
  int currentStep = 1;
  String selectedCourseType = "Lecture/Class";
  String selectedType = "Recorded", selectedStudyRoom = "Study";
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
              // Text Field with Title
              const Text(
                "Room Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Enter the name of the room",
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
                "Study room for",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              AppDropDown(
                  value: selectedStudyRoom,
                  hint: "Select a option", items: ["Study", "Item1", "Item2"].map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Container(margin: const EdgeInsets.only(left: 10),
                      child: Text(e)),
                );
              }).toList(),
                  onChanged: (val){
                    selectedStudyRoom = val!;
                    setState(() {});
                  }),
              const SizedBox(height: 20),
              const Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: textController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Tell buyers about your study room",
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
                "Add study room display picture",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.upload_file, color: Colors.grey),
                          const SizedBox(width: 10),
                          Text("Choose file",
                              style: const TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Add promotional video link",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Add link",
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
           /*   // Active/Reactive Toggle Switches
              Row(
                children: [
                  const Text(
                    "Auto create course group",
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
              Row(
                children: [
                  const Text(
                    "Post my course in related groups ",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Switch(
                    value: isReactive,
                    onChanged: (value) {
                      setState(() {
                        isReactive = value;
                      });
                    },
                    activeColor: primaryColorCode,
                  ),
                ],
              ),*/
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
                            builder: (context) => SellerCreateStep2Screen()),
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
      children: List.generate(4, (index) {
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
