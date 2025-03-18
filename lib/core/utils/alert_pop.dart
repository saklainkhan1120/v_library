import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/app_button_widget.dart';

class AlertHelper{

  static Widget getPopTwoButton(String firstText, String secondText, Function() onPressedFirst, Function() onPressedSecond){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 4,
            child: AppButtonWidget(label: firstText, onPress: onPressedFirst),
        ),const SizedBox(width: 8,),
        Expanded(flex: 4,
            child: AppButtonWidget(label: secondText, onPress: onPressedSecond)),
      ],
    );
  }

  /*static Widget getPopAlert(String firstText, String secondText, Function() onPressedFirst, Function() onPressedSecond){
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),),
          const SizedBox(height: 20,),
          Text(content,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),),
          const SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 4,
                child: AppButtonWidget(label: firstText, onPress: onPressedFirst),
              ),const SizedBox(width: 8,),
              Expanded(flex: 4,
                  child: AppButtonWidget(label: secondText, onPress: onPressedSecond)),
            ],
          ),
        ],
      ),
    );
  }*/


}