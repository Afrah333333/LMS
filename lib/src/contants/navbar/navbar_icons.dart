import 'package:flutter/material.dart';


class navbar_icons extends StatelessWidget {
  const navbar_icons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.message,)),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        PopupMenuButton<String>(
          color: Colors.white,
          onSelected: (value) {
            if (value == "profile") {
              // Handle profile option
            } else if (value == "logout") {
              // Handle logout option
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: "profile",
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ),
            PopupMenuItem<String>(
              value: "logout",
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ),
          ],
          icon: Icon(Icons.person),
          offset: Offset(0, 50),
        ),
      ],
    );
  }
}