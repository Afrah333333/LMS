import 'package:flutter/material.dart';
import 'Globals.dart';
import 'SizeConfig.dart';

class TodayText extends StatefulWidget {
  TodayState createState() => todayState;
}

class TodayState extends State<TodayText> {
  void refresh(String day) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      today,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.green,
          fontSize: 30),
    );
  }
}