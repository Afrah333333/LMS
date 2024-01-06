import 'package:flutter/material.dart';
import 'package:online_learning_platform/src/common_widgets/teacher/schedule/schedule_model.dart';
import 'Globals.dart';
import 'SizeConfig.dart';




void assignTimeTable(String currentDay) {
  schedule_timeTable.clear();
  switch (currentDay) {
    case "Monday":
      schedule_timeTable.add(Period(  name: 'WCMC',lengthInMinutes: 60 ));
      schedule_timeTable.add(Period(name:"DBMS", lengthInMinutes: 60 ));
      schedule_timeTable.add(Period(name:"DM", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name:"Recess", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name:"ADA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name:"OOPS Lab", lengthInMinutes: 60));
      break;

    case "Tuesday":
      schedule_timeTable.add(Period(name: "DM",lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "CSA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "ADA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "Recess", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "OOPS", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "CSI", lengthInMinutes: 120));
      break;

    case "Wednesday":
      schedule_timeTable.add(Period(name: "OOPS", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "DM", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "DBMS", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "Rececss", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "CSA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "Virtual Lab", lengthInMinutes: 120));
      break;

    case "Thursday":
      schedule_timeTable.add(Period(name: "CSA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "ADA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "OOPS", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "Recess", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "DM", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "CSA/HW Lab", lengthInMinutes: 120));
      break;

    case "Friday":
      schedule_timeTable.add(Period(name: "DBMS", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "ADA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "CSA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "Recess", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "DM", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "DBMS Lab", lengthInMinutes: 120));
      break;

    case "Saturday":
      schedule_timeTable.add(Period(name: "ADA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "DBMS", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "CSA", lengthInMinutes: 60));
      schedule_timeTable.add(Period(name: "OOPS", lengthInMinutes: 60));
      break;
  }
  setupExactTimes();
}

// -----------------------------------------------------------------------------

String determinePeriod() {
  DateTime now = DateTime.now();
  if (now.compareTo(collegeStart) >= 0 && now.compareTo(collegeEnd) <= 0) {
    displayTimer = true;
    for (Period period in schedule_timeTable) {
      if (now.compareTo(period.startsAt) >= 0 &&
          now.compareTo(period.endsAt) <= 0) {
        relativeEnding = period.endsAt;
        return period.name;
      }
    }
  }

  return "";
}

void setupExactTimes() {
  DateTime tmpTime = collegeStart;
  for (Period period in schedule_timeTable) {
    period.startsAt = tmpTime;
    tmpTime = tmpTime.add(Duration(minutes: period.lengthInMinutes));
    period.endsAt = tmpTime;
  }
}

// -----------------------------------------------------------------------------

Future asyncDayChooser(BuildContext context) async {
  return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Choose day',
              style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold)),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                assignTimeTable('Monday');
                todayState.refresh('Monday');
                Navigator.pop(context);
                remainingState.refresh();
              },
              child: Text('Monday',
                  style: TextStyle(
                      fontSize: 15)),
            ),
            SimpleDialogOption(
              onPressed: () {
                assignTimeTable('Tuesday');
                todayState.refresh('Tuesday');
                Navigator.pop(context);
                remainingState.refresh();
              },
              child: Text('Tuesday',
                  style: TextStyle(
                      fontSize: 15)),
            ),
            SimpleDialogOption(
              onPressed: () {
                assignTimeTable('Wednesday');
                todayState.refresh('Wednesday');
                Navigator.pop(context);
                remainingState.refresh();
              },
              child: Text('Wednesday',
                  style: TextStyle(
                      fontSize: 15)),
            ),
            SimpleDialogOption(
              onPressed: () {
                assignTimeTable('Thursday');
                todayState.refresh('Thursday');
                Navigator.pop(context);
                remainingState.refresh();
              },
              child: Text('Thursday',
                  style: TextStyle(
                      fontSize: 15)),
            ),
            SimpleDialogOption(
              onPressed: () {
                assignTimeTable('Friday');
                todayState.refresh('Friday');
                Navigator.pop(context);
                remainingState.refresh();
              },
              child: Text('Friday',
                  style: TextStyle(
                      fontSize: 15)),
            ),
            SimpleDialogOption(
                onPressed: () {
                  assignTimeTable('Saturday');
                  todayState.refresh('Saturday');
                  Navigator.pop(context);
                  remainingState.refresh();
                },
                child: Text('Saturday',
                    style: TextStyle(
                        fontSize: 15))),
          ],
        );
      });
}