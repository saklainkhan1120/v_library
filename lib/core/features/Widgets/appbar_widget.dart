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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 6,
        title: Visibility(visible: !isAuth,
            child: Text(title, style: TextStyle(fontWeight: FontWeight.w600),)),
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
          Visibility(visible: isAuth,
            child: TextButton(
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
          ),
          const SizedBox(width: 8), // Spacing between buttons
          // Signup Button
          Visibility(visible: isAuth,
            child: TextButton(
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
    );
  }
}
