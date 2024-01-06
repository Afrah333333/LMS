import 'package:flutter/material.dart';

import 'package:online_learning_platform/src/common_widgets/students/build_class.dart';
import 'package:online_learning_platform/src/common_widgets/students/header.dart';

import '../../contants/constants.dart';

class ClassesScreen extends StatelessWidget {
   const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Header(),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Jun",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("MON", style: kCalendarDay),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("TUE", textAlign:TextAlign.center,
                          style: kCalendarDay.copyWith(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ),
                    Text("WED", style: kCalendarDay),
                    Text(
                      "THU",
                      style: kCalendarDay
                    ),
                    Text("FRI", style: kCalendarDay),
                    Text("SAT", style: kCalendarDay),
                    Text("SUN", style: kCalendarDay),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  height: 740, // Same height as BuildClasses
                  width: 10.0, // Adjust the width as needed
                ),
              ),
              Expanded(
                flex: 12,
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      BuildClasses(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  height: 740, // Same height as BuildClasses
                  // Adjust the width as needed
                ),
              ),
            ],
          )



        ],
      ),
    );
  }
}