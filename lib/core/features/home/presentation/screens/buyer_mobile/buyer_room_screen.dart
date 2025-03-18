import 'package:flutter/material.dart';
import 'package:v_library/core/features/Widgets/app_button_widget.dart';
import 'package:v_library/core/features/Widgets/app_drop_down.dart';
import 'package:v_library/core/features/Widgets/appbar_widget.dart';
import 'package:v_library/core/features/home/presentation/screens/buyer_mobile/buyer_home_screen.dart';
import 'package:v_library/core/utils/colors.dart';
import 'package:v_library/core/utils/uihelper.dart';

class BuyerRoomScreen extends StatefulWidget {
  const BuyerRoomScreen({super.key});

  @override
  State<BuyerRoomScreen> createState() => _BuyerRoomScreenState();
}

class _BuyerRoomScreenState extends State<BuyerRoomScreen> {

  String selectedSubject = 'Subject', selectedHour = 'Hour', selectedMinute = 'Minute';
  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            scrollable: true,
            actionsPadding: EdgeInsets.zero,
            title: Text("Some rules before you start", style: TextStyle(color: Colors.black, fontSize: 18),),
            content: Text("1. Respect the Space – Maintain a professional and distraction-free environment. Avoid unnecessary background noise.\n2. Punctuality – Join the study session on time. Late entries disrupt the flow.\n3. Camera & Mic Etiquette – Keep your microphone muted when not speaking. Turning on your camera is encouraged but optional.\n4. No Spamming – Avoid sending unnecessary messages in the chat.\n5. Stay on-topic.Engagement – Actively participate in discussions, share insights, and ask relevant questions.\n6. No Disruptions – Avoid unnecessary movements, loud typing, or eating during sessions.\n7. Stay Focused – Keep study-related materials open. Do not browse social media or unrelated content.", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),),
            actions:
          [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppButtonWidget(label: "Agree & Join", onPress: (){
                    Navigator.of(context).pop();
                  }),
                  SizedBox(width: 8,),
                  AppButtonWidget(
                      bgColor: secondryTextColor.withOpacity(.2),
                      txtColor: Colors.black,
                      label: "Cancel", onPress: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BuyerHomeScreen(),
                    ));
                  }),
                ],
              ),
            ),

          ]
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
          child: AppBarWidget(isAuth: false, title: "Hi, Jaydeep",)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primaryColorCode.withOpacity(.2),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.play_circle, color: primaryColorCode,),
                      Text("  1h:13m:54s/2hr 5m", style: TextStyle(color: primaryColorCode),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Expanded(
                  child: GridView.builder(//padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 180,
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12),
                      itemCount: 8,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return SizedBox(height: getScreenHeight(context),
                                  child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      scrollable: true,

                                      title: Text("Set target for this session", style: TextStyle(color: Colors.black, fontSize: 18),),
                                      content: Column(
                                        children: [
                                          AppDropDown(
                                              value: selectedSubject,
                                              hint: "Select a option", items: ["Subject", "Item1", "Item2"].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Container(margin: const EdgeInsets.only(left: 10),
                                                  child: Text(e)),
                                            );
                                          }).toList(),
                                              onChanged: (val){
                                                selectedSubject = val!;
                                                setState(() {});
                                              }),
                                          SizedBox(height: 8,),
                                          TextField(
                                            controller: textController,
                                            decoration: InputDecoration(
                                              hintText: "Enter the name of the room",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(color: Colors.grey.shade300),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(color: Colors.grey.shade300),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(color: primaryColorCode),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8,),
                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: (){},
                                                child: Image.asset("assets/icons/play.png"),
                                              ),
                                              SizedBox(width: 5,),
                                              Expanded(
                                                child: AppDropDown(
                                                    value: selectedHour,
                                                    hint: "Select a option", items: ["Hour", "Item1", "Item2"].map((e) {
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    child: Container(margin: const EdgeInsets.only(left: 10),
                                                        child: Text(e)),
                                                  );
                                                }).toList(),
                                                    onChanged: (val){
                                                      selectedHour = val!;
                                                      setState(() {});
                                                    }),
                                              ),
                                              SizedBox(width: 5,),
                                              Expanded(
                                                child: AppDropDown(
                                                    value: selectedMinute,
                                                    hint: "Select a option", items: ["Minute", "Item1", "Item2"].map((e) {
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    child: Container(margin: const EdgeInsets.only(left: 10),
                                                        child: Text(e)),
                                                  );
                                                }).toList(),
                                                    onChanged: (val){
                                                      selectedMinute = val!;
                                                      setState(() {});
                                                    }),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      actions:
                                      [
                                        AppButtonWidget(label: "Set & Join", onPress: (){
                                          Navigator.of(context).pop();
                                        }),
                                      ]
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: primaryColorCode),
                              color: Colors.white,
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(width: getScreenWidth(context),
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image:
                                      AssetImage("assets/images/course_card.jpeg"), fit: BoxFit.cover)
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Riya Jain\nCA Student ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                                      Image.asset("assets/icons/message.png"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),


              ],
            ),
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: backGroundColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: AssetImage("assets/icons/microphone.png"))
                    ),
                  ),

                  Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: backGroundColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: AssetImage("assets/icons/camera.png"))
                    ),
                  ),

                  Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: backGroundColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: AssetImage("assets/icons/message.png"))
                    ),
                  ),

                  Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: backGroundColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: AssetImage("assets/icons/Chip.png"))
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
