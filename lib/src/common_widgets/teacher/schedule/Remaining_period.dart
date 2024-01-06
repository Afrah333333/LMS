import 'package:flutter/material.dart';
import 'Globals.dart';
import 'SizeConfig.dart';
import 'package:intl/intl.dart';

class RemainingPeriods extends StatefulWidget {
  RemainingPeriodsState createState() => remainingState;
}

class RemainingPeriodsState extends State<RemainingPeriods> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int actualCount = -1;
    return ListView.builder(
      itemCount: schedule_timeTable.length * 2,
      padding: EdgeInsets.all(2.5),
      itemBuilder: (context, i) {
        if (i.isOdd)
          return Divider(color: Colors.grey);
        else
          actualCount++;
        return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(schedule_timeTable[actualCount].name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green)),
                RichText(
                  textAlign: TextAlign.end,
                  text: new TextSpan(
                    style: new TextStyle(
                      fontFamily: 'ProductSans',
                      fontSize: 20,
                      color: Colors.green,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: DateFormat("hh:mm")
                              .format(schedule_timeTable[actualCount].startsAt)),
                      TextSpan(
                          text: '-',
                          style: TextStyle(fontSize: 25, color: Colors.pinkAccent)),
                      TextSpan(
                          text: DateFormat("hh:mm a")
                              .format(schedule_timeTable[actualCount].endsAt)),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}