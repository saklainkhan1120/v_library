import 'package:flutter/material.dart';
import 'package:v_library/core/utils/colors.dart';

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
        actions: [
          // Login Button
          TextButton(
            onPressed: () {
              // Navigate to Login
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColorCode,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const SizedBox(width: 8), // Spacing between buttons
          // Signup Button
          TextButton(
            onPressed: () {
              // Navigate to Signup
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColorCode,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Signup',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const SizedBox(width: 8), // Spacing after buttons
          IconButton(
            icon: Image.asset('assets/icons/bell.png', width: 24, height: 24),
            onPressed: () {},
          ),
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
      body: Column(
        children: [
          // Library Icon
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Image.asset(
              'assets/images/v.png',
              width: 183,
              height: 45,
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 48, // Fixed height
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search anything',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: Image.asset(
                      'assets/icons/search.png',
                      width: 24, // Icon size
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      color: primaryColorCode,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.tune,
                            color: Colors.white, size: 19.1), // Icon size
                      ),
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),

          // Grid of Icons
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 90, // Maximum width of each grid item
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1, // Ensure square items
                ),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  return _buildGridItem(gridItems[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(GridItem item) {
    return SizedBox(
      width: 56.29, // Fixed width
      height: 56.29, // Fixed height
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
}

class GridItem {
  final String title;
  final String imagePath;

  GridItem(this.title, this.imagePath);
}
