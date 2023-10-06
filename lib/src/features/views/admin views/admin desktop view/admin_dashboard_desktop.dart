import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AdminDashboardDesktop extends StatefulWidget {
  const AdminDashboardDesktop({super.key});

  @override
  State<AdminDashboardDesktop> createState() => _AdminDashboardDesktopState();
}

class _AdminDashboardDesktopState extends State<AdminDashboardDesktop> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 80),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard Dear Admin!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                // Four Responsive Containers
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150, // Adjust height as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.work_history),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "My program",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("18%", style: TextStyle(fontSize: 30)),
                            SizedBox(height: 2),
                            LinearProgressIndicator(
                              color: Colors.white10,
                              value: 0.18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150, // Adjust height as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.wallet_membership_outlined),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Members",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("180", style: TextStyle(fontSize: 30)),
                            SizedBox(height: 2),
                            LinearProgressIndicator(
                              color: Colors.white10,
                              value: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150, // Adjust height as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.perm_contact_calendar_outlined),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Mentor",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1", style: TextStyle(fontSize: 30)),
                            SizedBox(height: 2),
                            LinearProgressIndicator(
                              color: Colors.white10,
                              value: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150, // Adjust height as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.view_list_outlined),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Mentorship Programs",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("11", style: TextStyle(fontSize: 30)),
                            SizedBox(height: 2),
                            LinearProgressIndicator(
                              color: Colors.white10,
                              value: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 350, // Adjust height as needed
                    child: SingleChildScrollView(
                      child: Container(
                        child: TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 20),
                          lastDay: DateTime.utc(2040, 10, 20),
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(_selectedDay, selectedDay)) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }
                          },
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xFF040B25),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: 350, // Adjust height as needed
                    child: Center(child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Progress',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 260,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  double chartSize = constraints.maxWidth < constraints.maxHeight
                                      ? constraints.maxWidth
                                      : constraints.maxHeight;

                                  double centerSpaceRadius = chartSize * 0.1;
                                  double sectionRadius = chartSize * 0.5;

                                  return PieChart(
                                    PieChartData(
                                      centerSpaceRadius: centerSpaceRadius,
                                      sectionsSpace: 3,
                                      sections: [
                                        PieChartSectionData(
                                          title: "70%",
                                          titleStyle: TextStyle(color: Colors.white),
                                          value: 70,
                                          color: Colors.purple,
                                          radius: sectionRadius,
                                        ),
                                        PieChartSectionData(
                                          title: "",
                                          value: 30,
                                          color: Colors.white70,
                                          radius: sectionRadius,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )

                          ),
                        ),
                      ],
                    ),),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
