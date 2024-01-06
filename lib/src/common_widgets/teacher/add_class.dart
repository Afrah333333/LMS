import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:online_learning_platform/src/common_widgets/admin/t_register.dart';
import 'package:online_learning_platform/src/common_widgets/admin/RTeacher.dart';
import 'package:online_learning_platform/src/common_widgets/teacher/task.dart';

import 'get_helper.dart';
import 'group_tile_teacher.dart';

class TeacherClasses extends StatefulWidget {
  final String teacherId;
  final String schoolId;

  TeacherClasses({required this.teacherId, required this.schoolId});

  @override
  _TeacherClassesState createState() => _TeacherClassesState();
}

class _TeacherClassesState extends State<TeacherClasses> {
  var groups;

  @override
  void initState() {
    groups = GetHelper.getData(widget.teacherId, 'get_teacher_groups',
        'teacher_id'); // get the data using this function from GetHelper class we pass
    //the teacher id and name of php file that we use to get data then kind of input for data
    // if you do not understand go and have look at GetHelper class
    super.initState();
  }

  // go to task page
  goTaskForm(String groupId, String schoolId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TaskPage(
            groupId: groupId,
            schoolId: schoolId,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Color.fromRGBO(154, 233, 178, 1),
              Color.fromRGBO(173, 187, 238, 1),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child:
                          Text(
                            "Classes",
                            style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                              fontSize: 40,)

                          )),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100))),
                  padding: EdgeInsets.all(20),
                  // we will use future builder to show the data in a list view
                  // we put the future variable
                  // check if there is no show a message to user no data
                  // else show a list view with tiles tha show our data
                  child: FutureBuilder(
                    future: groups,
                    builder: (context, snapshots) {
                      if (!snapshots.hasData || snapshots.data.hashCode ==0 ) {
                        return Center(
                            child: Text('No Classes Right now',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)));
                      }
                      return ListView.builder(
                        itemCount: snapshots.data.hashCode,
                        itemBuilder: (context, index) {
                          return GroupTeacherTile(
                            name: 'Tr Sarah',
                            subject: 'Biology',
                            time: '11:00-1:00pm',
                            function: () => goTaskForm(
                                '', widget.schoolId),
                          );
                        },
                      );
                    },
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}