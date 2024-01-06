
import 'package:flutter/material.dart';
import 'package:online_learning_platform/src/common_widgets/teacher/schedule/timeutills.dart';
import 'Remaining_period.dart';
import 'SizeConfig.dart';

import 'TodayText.dart';
import 'ActiveTime.dart';
import 'CurrentPeriod.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(

            backgroundColor:  Colors.green,
            centerTitle: true,
            title: Text(
              'TIME TABLE',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            asyncDayChooser(context);
                          },
                          child: TodayText())
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 13.5),
                  child: Center(
                    child: Column(
                      children: <Widget>[CurrentPeriod()],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Center(
                    child: Column(
                      children: <Widget>[ActiveTime()],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Divider(
                      color: Colors.grey,
                    )),
                Expanded(child: RemainingPeriods())
              ],
            ),
          ),
        ));
  }
}