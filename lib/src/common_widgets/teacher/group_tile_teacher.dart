import 'package:flutter/material.dart';

class GroupTeacherTile extends StatelessWidget {

  final String name;
  final String subject;
  final String time;



  GroupTeacherTile(
      {this.name="", this.subject="",this.time="", required Function() function});

  @override
  Widget build(BuildContext context) {


    return Column(
      children: <Widget>[


        ListTile(
            leading: Icon(
              Icons.school,

            ),
            title: Text(name),
            subtitle: Text(time),
            trailing: TextButton(
              child: Text('Add Task',style:TextStyle(color: Colors.white),),
              onPressed: () {},
            ) ,
            onTap:() {}

        ),


        Divider(thickness: 1.5,)
      ],
    );
  }
}