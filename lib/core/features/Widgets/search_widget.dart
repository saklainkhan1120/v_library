import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SearchWidget extends StatelessWidget {
   final Function(String val) onChange;
   const SearchWidget({ required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 48, // Fixed height
        child: TextField(
          onChanged: onChange,
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
    );
  }
}