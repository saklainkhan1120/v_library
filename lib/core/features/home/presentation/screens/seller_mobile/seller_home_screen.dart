import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/app_button_widget.dart';
import 'package:v_library/core/features/Widgets/appbar_widget.dart';
import 'package:v_library/core/features/Widgets/search_widget.dart';
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
        child: Stack(alignment: Alignment.bottomRight,
          children: [
            Column(
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

                Expanded(
                  child: TabBarView(
                      controller: tabController,
                      children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Available Virtual Libraries", style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),),
                        SizedBox(height: 16,),
                       SizedBox(height: getScreenHeight(context)-300,
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
                        ],
                      ),
                    ),
                    Text(""),
                  ]),
                )
              ],
            ),
            AppButtonWidget(label: " Create", onPress: (){}, isIcon: true,)
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
                  Image.asset("assets/icons/live.png", color: errorColor,),

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


