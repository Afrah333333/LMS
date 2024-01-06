import 'package:flutter/material.dart';

import 'package:online_learning_platform/src/common_widgets/students/posts.dart';


class DiscussionPage extends StatefulWidget {
  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        body: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
          child: Column(
            children: [
              Text(
                "Posts",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Expanded(child: Posts())
            ],
          ),
        ),
    );
  }
}