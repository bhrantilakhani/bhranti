import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listview_animation extends StatefulWidget {
  const listview_animation({super.key});

  @override
  State<listview_animation> createState() => _listview_animationState();
}

class _listview_animationState extends State<listview_animation> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  List texts = [
    "Moneterization",
    "Pie chart",
    "Flag",
    "Notification",
    "Savings",
    "Cloud",
    "NightLight",
    "Assignment",
    "Location",
    "Settings",
    "Home",
    "Person",
    "Like"
  ];
  List icons = [
    Icons.monetization_on,
    Icons.pie_chart,
    Icons.flag,
    Icons.notifications,
    Icons.savings,
    Icons.cloud,
    Icons.nightlight,
    Icons.assignment,
    Icons.location_on_outlined,
    Icons.settings,
    Icons.home,
    Icons.person,
    Icons.favorite_sharp,
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
  //     setState(() {
  //       startAnimation = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        startAnimation = true;
                      });
                    });
                  },
                  child: Text(
                    ' SHOW LIST',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: texts.length,
                  itemBuilder: (context, index) {
                    return item(index);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 100)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index + 1}.${texts[index]}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Icon(icons[index]),
        ],
      ),
    );
  }
}
