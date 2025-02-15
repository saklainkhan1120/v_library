import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/appbar_widget.dart';
import 'package:v_library/core/features/Widgets/search_widget.dart';
import 'package:v_library/core/features/home/presentation/screens/buyer_mobile/buyer_home_screen.dart';
import 'package:v_library/core/features/home/presentation/screens/home_page.dart';
import 'package:v_library/core/features/home/presentation/screens/seller_mobile/seller_home_screen.dart';
import 'package:v_library/core/utils/alert_pop.dart';
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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: AppBarWidget()),
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
              onChange: (val) {},
            ),

            // Single Row of Icons
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: gridItems.map((item) {
                  return _buildGridItem(context, item);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, GridItem item) {
    return GestureDetector(
      onTap: () {
        onItemPresses(context, item.title);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            width: 60, // Adjust the icon size as per your requirement
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Image.asset(
              item.imagePath,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(height: 8), // Spacing between icon and text

          // Text Below Icon
          SizedBox(
            width: 70, // Fixed width for proper alignment
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              maxLines: 2, // Ensures text breaks into 2 lines
              overflow: TextOverflow.visible, // No ellipsis, wraps the text
              softWrap: true, // Enables wrapping for text
            ),
          ),
        ],
      ),
    );
  }

  void onItemPresses(BuildContext context, String value) {
    if (value == "Virtual Library") {
      // Dialog for Virtual Library
      showInfoDialog(
          context,
          AlertHelper.getPopTwoButton("Seller", "Buyer", () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SellerHomeScreen()));
          }, () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BuyerHomeScreen()));
          }));
    } else if (value == "Lectures & Classes") {
      // Navigate to HomeScreen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(), // HomeScreen to be navigated
        ),
      );
    } else {
      // For other icons
      showAlertDialog(context, "Not available!");
    }
  }
}

class GridItem {
  final String title;
  final String imagePath;

  GridItem(this.title, this.imagePath);
}
