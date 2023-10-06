import 'package:flutter/material.dart';

class AdminRegisteryMobile extends StatefulWidget {
  const AdminRegisteryMobile({super.key});

  @override
  State<AdminRegisteryMobile> createState() => _AdminRegisteryMobileState();
}

class _AdminRegisteryMobileState extends State<AdminRegisteryMobile> {
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
