import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  List<String> times = ['9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM'];

  List<List<String>> classSchedule = List.generate(5, (day) => List.filled(5, 'Empty'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Class Schedules and Timetables'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Day and Time Headers
              Row(
                children: <Widget>[
                  SizedBox(width: 70.0),
                  for (var day in days)
                    Container(
                      width: 80.0,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      alignment: Alignment.center,
                      child: Text(day),
                    ),
                ],
              ),
              for (int timeIndex = 0; timeIndex < times.length; timeIndex++)
                Row(
                  children: <Widget>[
                    // Time Slot
                    Container(
                      width: 70.0,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      alignment: Alignment.center,
                      child: Text(times[timeIndex]),
                    ),
                    // Class Schedule for Each Day
                    for (int dayIndex = 0; dayIndex < days.length; dayIndex++)
                      GestureDetector(
                        onTap: () {
                          // Implement logic for adding/editing classes here
                          _showClassDetailsDialog(dayIndex, timeIndex);
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Text(classSchedule[dayIndex][timeIndex]),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showClassDetailsDialog(int dayIndex, int timeIndex) {
    showDialog(
      context: context,
      builder: (context) {
        String classDetails = classSchedule[dayIndex][timeIndex];
        return AlertDialog(
          title: Text('Add/Modify Class'),
          content: TextField(
            controller: TextEditingController(text: classDetails),
            onChanged: (value) {
              setState(() {
                classSchedule[dayIndex][timeIndex] = value;
              });
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}


