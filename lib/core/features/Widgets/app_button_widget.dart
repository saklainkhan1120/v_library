import 'package:flutter/material.dart';
import 'package:v_library/core/utils/colors.dart';

class AppButtonWidget extends StatelessWidget {
  final String label;
  final Function() onPress;
  final bool isIcon;
  const AppButtonWidget({
    required this.label,
    required this.onPress,
    this.isIcon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: primaryColorCode
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(visible: isIcon,child: Icon(Icons.add, color: Colors.white,)),
            Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
          ],
        ),
      ),
    );
  }
}