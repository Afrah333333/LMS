import 'package:flutter/material.dart';

import '../../features/views/students_views/student mobile view/student_dashboard_mobile.dart';
import '../../features/views/students_views/student_desktop view/student_dashboard_desktop.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});


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
                    Expanded(child: StudentDashboardDesktop()),
                ],
              );
            } else {
              // Mobile view
              return Stack(
                children: [
                  StudentDashboardMobile(),
                  // Add a button to toggle the sidebar
                ],
              );
            }
          },
        )
    );
  }
}
