import 'package:flutter/material.dart';

import '../../features/views/students_views/student mobile view/login_mobile.dart';
import '../../features/views/students_views/student_desktop view/login_desktop.dart';

class StudentRegistery extends StatelessWidget {
  const StudentRegistery({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 750;

    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Desktop view with sidebar
              return Row(
                children: [
                  if (!isMobile)
                    Expanded(child: LoginDesktop()),
                ],
              );
            } else {
              // Mobile view
              return Stack(
                children: [
                  LoginMobile(),
                  // Add a button to toggle the sidebar
                ],
              );
            }
          },
        )
    );
  }
}
