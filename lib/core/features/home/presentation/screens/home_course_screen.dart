import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_library/bloc/course_bloc/course_bloc.dart';
import 'package:v_library/repository/course_repo.dart';

import '../../../../../bloc/course_bloc/course_event.dart';
import 'list_item/course_list.dart';

class HomeScreenCourse extends StatefulWidget {
  const HomeScreenCourse({Key? key}) : super(key: key);

  @override
  State<HomeScreenCourse> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenCourse> {
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {'label': 'Courses', 'icon': Icons.home},
    {'label': 'Live', 'icon': Icons.live_tv},
    {'label': 'Analytics', 'icon': Icons.analytics},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hi, Smriti',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
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
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mail_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search anything',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        const Icon(Icons.tune, color: Colors.white, size: 20),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedTabIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.deepOrange : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          tabs[index]['icon'],
                          color: isSelected ? Colors.white : Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          tabs[index]['label'],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 24),

          // Your Courses Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Courses',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Course Card



        ],
      ),
    );
  }
}
