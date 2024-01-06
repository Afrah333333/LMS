import 'package:flutter/material.dart';

class TeacherRegisteryMobile extends StatefulWidget {
  const TeacherRegisteryMobile({super.key});

  @override
  State<TeacherRegisteryMobile> createState() => _TeacherRegisteryMobileState();
}

class _TeacherRegisteryMobileState extends State<TeacherRegisteryMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register Student!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
