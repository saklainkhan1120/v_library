import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  final String hint;
  String value;
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  final Function(BuildContext context)? selectedItemBuilder;
  bool isWhiteBag, isSearchable, isGenderDropdown;
  double? verticalMargin;
  Color? whiteBag;
  AppDropDown(
      {super.key, required this.hint,
      this.value = '',
      required this.items,
      required this.onChanged,
      this.selectedItemBuilder,
      this.isGenderDropdown = false,
      this.isSearchable = false,
      this.isWhiteBag = false,
      this.whiteBag = Colors.white,
      this.verticalMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.symmetric(vertical: verticalMargin ?? 5, horizontal: 0),
        decoration: ShapeDecoration(
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            side: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: Colors.grey,
            ),
          ),
        ),
        child: DropdownButton(

          style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            hint: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 13),
              child: Text(
                hint ?? '',
              ),
            ),
            isExpanded: true,
            value: value,
            icon: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.keyboard_arrow_down)),
            underline: SizedBox(),
            iconEnabledColor: Colors.black,
            onChanged: onChanged,
            items: items));
  }
}
