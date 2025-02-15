import 'package:flutter/material.dart';
import 'package:v_library/core/utils/colors.dart';

class AppBarWidget extends StatelessWidget {
  final bool isAuth;
  final String title;

  const AppBarWidget({
    this.isAuth = true,
    this.title = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 6,
        title: Visibility(
          visible: !isAuth,
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
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
          Visibility(
            visible: isAuth,
            child: SizedBox(
              width: 105, // Fixed width
              height: 45, // Fixed height
              child: OutlinedButton(
                onPressed: () {
                  // Navigate to Login
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: primaryColorCode, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero, // No extra padding
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8), // Spacing between buttons
          // Signup Button
          Visibility(
            visible: isAuth,
            child: SizedBox(
              width: 105, // Fixed width
              height: 45, // Fixed height
              child: TextButton(
                onPressed: () {
                  // Navigate to Signup
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColorCode,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero, // No extra padding
                ),
                child: const Text(
                  'Signup',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8), // Spacing after buttons
        ],
      ),
    );
  }
}
