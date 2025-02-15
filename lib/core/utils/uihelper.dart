import 'package:flutter/material.dart';
import 'package:v_library/core/utils/colors.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Future<bool> showAlertDialog(BuildContext context, String msg) async {
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: primaryColorCode),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    content: Text(msg),
    title: const Text('Message'),
    actions: [
      okButton,
    ],
  );

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  return true;
}

Future<bool> showInfoDialog(BuildContext context, Widget widget) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: widget);
      });
  return true;
}
