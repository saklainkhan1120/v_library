import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/appbar_widget.dart';
import 'package:v_library/core/features/Widgets/search_widget.dart';
import 'package:v_library/core/features/home/presentation/screens/buyer_mobile/buyer_home_screen.dart';
import 'package:v_library/core/features/home/presentation/screens/seller_mobile/seller_home_screen.dart';
import 'package:v_library/core/utils/alert_pop.dart';
import 'package:v_library/core/utils/colors.dart';
import 'package:v_library/core/utils/uihelper.dart';

class OnboaringPage extends StatelessWidget {
  final List<GridItem> gridItems = [
    GridItem('Virtual Library', 'assets/icons/book.png'),
    GridItem('Group Discussion', 'assets/icons/people.png'),
    GridItem('Lectures & Classes', 'assets/icons/teacher.png'),
    GridItem('Physical Library', 'assets/icons/notes.png'),
    GridItem('Print Services', 'assets/icons/printer.png'),
  ];

  OnboaringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
      child: AppBarWidget()),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Library Icon
            Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
              child: Image.asset(
                'assets/images/v.png',
                width: 183,
                height: 45,
              ),
            ),

            // Search Bar
            SearchWidget(
              onChange: (val){},
            ),

            // Grid of Icons
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 90, // Maximum width of each grid item
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1, // Ensure square items
                  ),
                  itemCount: gridItems.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(context,gridItems[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context ,GridItem item) {
    return GestureDetector(
      onTap: (){
        onItemPresses(context, item.title);
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40, // Icon size
            height: 40, // Icon size
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(
              item.imagePath,
              width: 24, // Adjust icon size inside the container
              height: 24,
            ),
          ),
          const SizedBox(height: 4), // Spacing between icon and text
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }


  void onItemPresses(BuildContext context, String value){
    if(value == "Virtual Library"){
      showInfoDialog(context, AlertHelper.getPopTwoButton("Seller", "Buyer",
              (){
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SellerHomeScreen()));
          },
              (){
        Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BuyerHomeScreen()));
          }));
         }else {
      showAlertDialog(context, "Not available!");
    }
  }

}




class GridItem {
  final String title;
  final String imagePath;

  GridItem(this.title, this.imagePath);
}
