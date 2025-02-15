import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/app_button_widget.dart';
import 'package:v_library/core/features/Widgets/app_drop_down.dart';
import 'package:v_library/core/features/Widgets/appbar_widget.dart';
import 'package:v_library/core/features/Widgets/search_widget.dart';
import 'package:v_library/core/features/home/presentation/screens/buyer_mobile/buyer_room_screen.dart';
import 'package:v_library/core/utils/colors.dart';
import 'package:v_library/core/utils/uihelper.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;
  Color tabColor = secondryTextColor;
  String selectedDrop = 'UPSC';

  final List<Map<String, String>> demoData = [
    {"name": "Complete my CA chapter1", "date": "14/feb/2025"},
    {"name": "Complete P&L entries", "date": "14/feb/2025"},
    {"name": "Study with concentration", "date": "16/feb/2025"},
    {"name": "Complete my CA chapter1", "date": "14/feb/2025"},
    {"name": "Complete P&L entries", "date": "14/feb/2025"},
    {"name": "Study with concentration", "date": "16/feb/2025"},
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchWidget(
              onChange: (val) {},
            ),
          ),

          // TabBar Section
          TabBar(
              controller: tabController,
              unselectedLabelColor: secondryTextColor,
              labelColor: primaryColorCode,
              indicatorColor: scaffoldBackgroundColor,
              dividerColor: scaffoldBackgroundColor,
              labelPadding: EdgeInsets.zero,
              onTap: (int tab) {
                setState(() {
                  selectedTabIndex = tab;
                });
              },
              tabs: [
                _buildTabItem(
                  iconImg: "home.png",
                  label: "Home",
                  isSelected: selectedTabIndex == 0,
                ),
                _buildTabItem(
                  iconImg: "people.png",
                  label: "Rooms",
                  isSelected: selectedTabIndex == 1,
                ),
                _buildTabItem(
                  iconImg: "people.png",
                  label: "Target",
                  isSelected: selectedTabIndex == 2,
                ),
              ]),

          // TabBarView Section
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  // Home Tab
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Available Virtual Libraries",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return buildTabOneData();
                              }),
                        ),
                      ],
                    ),
                  ),

                  // Rooms Tab
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/sun.jpeg",
                            width: 18,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Focus Group",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "Description of the class here",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 20),
                          Stack(
                            children: [
                              Container(
                                width: getScreenWidth(context),
                                height: getScreenWidth(context) / 1.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.transparent,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/course_card.jpeg"),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                color: primaryColorCode,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                child: const Text(
                                  "Your videos",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildIconButton(
                                  Icons.shopping_bag_outlined, () {}),
                              _buildIconButton(Icons.mic, () {}),
                              AppButtonWidget(
                                  label: "Join Now",
                                  onPress: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BuyerRoomScreen()));
                                  }),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: successColor,
                                size: 16,
                              ),
                              const Text(
                                " 23 others in session",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Target Tab
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: DataTable(
                            border: TableBorder(
                                horizontalInside: BorderSide(
                                  color: secondryTextColor.withOpacity(0.5),
                                ),
                                verticalInside: BorderSide(
                                  color: secondryTextColor.withOpacity(0.5),
                                )),
                            headingRowColor: MaterialStateProperty.all(
                                primaryColorCode.withOpacity(0.2)),
                            columns: const [
                              DataColumn(
                                  label: Text(
                                "Session name",
                                style: TextStyle(color: primaryColorCode),
                              )),
                              DataColumn(
                                  label: Text(
                                "Date",
                                style: TextStyle(color: primaryColorCode),
                              )),
                            ],
                            rows: demoData
                                .map((data) => DataRow(
                                      cells: [
                                        DataCell(Text(data["name"]!)),
                                        DataCell(Text(data["date"]!)),
                                      ],
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget buildTabOneData() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: secondryTextColor.withOpacity(.5)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icons/sun.jpeg",
                    width: 18,
                  ),
                  const Text(
                    " UPSC Aspirants",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  )
                ],
              ),
              const SizedBox(width: 5),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: successColor,
                    size: 16,
                  ),
                  const Text(
                    " 23 in room",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
              "This is group where all highly motivated UPSC aspirants get motivation form."),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButtonWidget(
                label: "Join Room",
                onPress: () {},
              ),
              RichText(
                  textAlign: TextAlign.end,
                  text: const TextSpan(
                      text: "300/day\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                      children: [
                        TextSpan(
                          text: "(free with ads)",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ]))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTabItem(
      {required String iconImg,
      required String label,
      required bool isSelected}) {
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
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5),
          Text(label,
              style: TextStyle(
                  color: isSelected ? primaryColorCode : secondryTextColor)),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: backGroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black54),
        onPressed: onPressed,
      ),
    );
  }
}
