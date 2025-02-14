import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/app_button_widget.dart';
import 'package:v_library/core/features/Widgets/app_drop_down.dart';
import 'package:v_library/core/features/Widgets/appbar_widget.dart';
import 'package:v_library/core/features/Widgets/search_widget.dart';
import 'package:v_library/core/features/home/presentation/screens/seller_mobile/seller_create_step1.dart';
import 'package:v_library/core/utils/colors.dart';
import 'package:v_library/core/utils/uihelper.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen>with SingleTickerProviderStateMixin {

  late TabController tabController;
  int selectedTabIndex = 0;
  Color tabColor = secondryTextColor;
  String selectedDrop = 'UPSC';

  final List<Map<String, String>> demoData = [
    {"name": "John Doe", "phone": "123-456-7890", "email": "john@example.com"},
    {"name": "Jane Smith", "phone": "987-654-3210", "email": "jane@example.com"},
    {"name": "Alice Brown", "phone": "555-678-9012", "email": "alice@example.com"},
    {"name": "Bob Johnson", "phone": "444-123-4567", "email": "bob@example.com"},
    {"name": "Jane Smith", "phone": "987-654-3210", "email": "jane@example.com"},
    {"name": "Alice Brown", "phone": "555-678-9012", "email": "alice@example.com"},
    {"name": "John Doe", "phone": "123-456-7890", "email": "john@example.com"},
    {"name": "John Doe", "phone": "123-456-7890", "email": "john@example.com"},
    {"name": "Jane Smith", "phone": "987-654-3210", "email": "jane@example.com"},
    {"name": "Jane Smith", "phone": "987-654-3210", "email": "jane@example.com"},
  ];
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
          child: AppBarWidget(isAuth: false, title: "Hi, Jaydeep",)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search Bar
            SearchWidget(
              onChange: (val){},
            ),
            SizedBox(height: 20,),
            TabBar(
                controller: tabController,
                unselectedLabelColor: secondryTextColor,
                labelColor: primaryColorCode,
                indicatorColor: scaffoldBackgroundColor,
                dividerColor: scaffoldBackgroundColor,
                labelPadding: EdgeInsets.zero,
                onTap: (int tab){
                  setState(() {
                   setState(() {
                     selectedTabIndex = tab;
                   });
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
                    label: "Customers",
                    isSelected: selectedTabIndex == 1,
                  )
            ]),
        
            SizedBox(
            height: getScreenHeight(context)-240,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Available Virtual Libraries", style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),),
                    SizedBox(height: 16,),
                   Expanded(//height: getScreenHeight(context)-340,
                     child: ListView.separated(
                       separatorBuilder: (context, index){
                         return SizedBox(height: 10,);
                       },
                      // physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                         itemCount: 5,
                         itemBuilder: (context, index){
                           return buildTabOneData();
                         }),
                   ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          AppButtonWidget(label: " Create", onPress: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellerCreateStep1Screen()),
                            );
                          }, isIcon: true,),
                        ],
                      )
                    ],
                  ),
                ),
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 4,
                              child: AppDropDown(
                                  value: selectedDrop,
                                  hint: "UPSC", items: ["UPSC", "Item1", "Item2"].map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Container(margin: const EdgeInsets.only(left: 10),
                                      child: Text(e)),
                                );
                              }).toList(),
                                  onChanged: (val){
                                    selectedDrop = val!;
                                  }),
                            ),
                            Expanded(flex: 6,
                                child: SizedBox()),
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                                child: DataTable(
                                  border: TableBorder(horizontalInside: BorderSide(color: secondryTextColor.withOpacity(.5),),
                                  verticalInside: BorderSide(color: secondryTextColor.withOpacity(.5),)),
                                  headingRowColor: WidgetStateProperty.all(primaryColorCode.withOpacity(.2)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: secondryTextColor.withOpacity(.5))
                                  ),
                                  columns: const [
                                    DataColumn(label: Text("Name", style: TextStyle(color: primaryColorCode),)),
                                    DataColumn(label: Text("Phone", style: TextStyle(color: primaryColorCode),)),
                                    DataColumn(label: Text("Email", style: TextStyle(color: primaryColorCode),)),
                                  ],
                                  rows: demoData
                                      .map(
                                        (data) => DataRow(
                                      cells: [
                                        DataCell(Text(data["name"]!)),
                                        DataCell(Text(data["phone"]!)),
                                        DataCell(Text(data["email"]!)),
                                      ],
                                    ),
                                  )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTabOneData(){
    return  Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: secondryTextColor.withOpacity(.5)),
        color: Colors.white,
      ),

      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/sun.jpeg", width: 18,),

                  Text(" UPSC Aspirants", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),)
                ],
              ),
              SizedBox(width: 5,),
              Row(
                children: [
                  Icon(Icons.circle, color: successColor, size: 16,),
                  Text(" 23 in room", style: TextStyle(fontWeight: FontWeight.w400),)
                ],
              ),
            ],
          ),
          SizedBox(height: 12,),
          Text("This is group where all highly motivalted UPSC aspirants get motivation form."),

          SizedBox(height: 20,),
          Row(crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButtonWidget(
                label: "Join Room",
                onPress: (){},
              ),
              Text("Edit", style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }




  Widget _buildTabItem({required String iconImg, required String label, required bool isSelected}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? primaryColorCode.withOpacity(0.2) : secondryTextColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/$iconImg", color: isSelected ? primaryColorCode : secondryTextColor, width: 18, height: 18, fit: BoxFit.contain,),
          SizedBox(width: 5),
          Text(label, style: TextStyle(color: isSelected ? primaryColorCode : secondryTextColor)),
        ],
      ),
    );
  }

}


