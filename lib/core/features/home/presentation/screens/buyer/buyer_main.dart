import 'package:flutter/material.dart';
import 'package:v_library/core/utils/colors.dart';
import 'package:v_library/core/utils/ui_helpers.dart';
import 'package:v_library/core/widgets/app_button_widgets.dart';
import 'package:v_library/core/widgets/appbar_widgets.dart';
import 'package:v_library/core/widgets/search_widgets.dart';

class BuyerMainScreen extends StatefulWidget {
  const BuyerMainScreen({super.key});

  @override
  State<BuyerMainScreen> createState() => _BuyerMainScreenState();
}

class _BuyerMainScreenState extends State<BuyerMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this); // Changed to 3 tabs
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            isAuth: false,
            title: "Hi, Jaydeep",
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                SearchWidget(onChange: (val) {}),
                const SizedBox(height: 20),
                TabBar(
                    controller: tabController,
                    unselectedLabelColor: secondryTextColor,
                    labelColor: primaryColorCode,
                    indicatorColor: scaffoldBackgroundColor,
                    dividerColor: scaffoldBackgroundColor,
                    labelPadding: EdgeInsets.zero,
                    onTap: (int tab) {
                      setState(() => selectedTabIndex = tab);
                    },
                    tabs: [
                      _buildTabItem(
                        iconImg: "home.png",
                        label: "Home",
                        isSelected: selectedTabIndex == 0,
                      ),
                      _buildTabItem(
                        iconImg: "people.png", // Change icon as needed
                        label: "Rooms",
                        isSelected: selectedTabIndex == 1,
                      ),
                      _buildTabItem(
                        iconImg: "target.png", // Add target icon
                        label: "Target",
                        isSelected: selectedTabIndex == 2,
                      )
                    ]),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // Home Tab Content
                      _buildLibraryList(),

                      // Rooms Tab Content
                      _buildRoomsContent(),

                      // Target Tab Content
                      _buildTargetContent(),
                    ],
                  ),
                )
              ],
            ),
            AppButtonWidget(
              label: " Create",
              onPress: () {},
              isIcon: true,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLibraryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Available Virtual Libraries",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: getScreenHeight(context) - 300,
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 3, // Update with actual data length
                itemBuilder: (context, index) => _buildLibraryItem(index)),
          ),
        ],
      ),
    );
  }

  Widget _buildLibraryItem(int index) {
    List<Map<String, dynamic>> libraries = [
      {
        "title": "UPSC Aspirants",
        "price": "\$300/day",
        "members": "23 in room",
        "description":
            "This is a group where all highly motivated UPSC aspirants get motivation from."
      },
      {
        "title": "CA Students",
        "price": "\$50/day",
        "members": "15 in room",
        "description": "Dedicated space for Chartered Accountancy students."
      },
      // Add more items
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: secondryTextColor.withOpacity(.5)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/live.png", color: errorColor),
                  Text(" ${libraries[index]['title']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.circle, color: Colors.red, size: 16),
                  Text(" ${libraries[index]['members']}",
                      style: const TextStyle(fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(libraries[index]['description']!),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButtonWidget(
                label: "Join Room",
                onPress: () {},
              ),
              Text(libraries[index]['price']!,
                  style: TextStyle(
                      color: primaryColorCode, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRoomsContent() {
    return const Center(child: Text("Rooms Content")); // Add actual content
  }

  Widget _buildTargetContent() {
    return const Center(child: Text("Target Content")); // Add actual content
  }

  Widget _buildTabItem({
    required String iconImg,
    required String label,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected
            ? primaryColorCode.withOpacity(0.2)
            : secondryTextColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/$iconImg",
            color: isSelected ? primaryColorCode : secondryTextColor,
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 5),
          Text(label,
              style: TextStyle(
                  color: isSelected ? primaryColorCode : secondryTextColor,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
