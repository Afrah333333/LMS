import 'package:flutter/material.dart';
import 'package:online_learning_platform/src/common_widgets/teacher/schedule/timeutills.dart';
import 'Globals.dart';


class CurrentPeriod extends StatefulWidget {
  CurrentState createState() => currentPeriodState;
}

class CurrentState extends State<CurrentPeriod> {
  void refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Text(determinePeriod(),
    );
  }
}