import 'package:flutter/material.dart';

import '../../features/views/teacher views/teacher desktop view/teacher_dashboard_desktop.dart';
import '../../features/views/teacher views/teacher mobile view/teacher_dashboard_mobile.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});


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
                    Expanded(child: TeacherDashboardDesktop()),
                ],
              );
            } else {
              // Mobile view
              return Stack(
                children: [
                  TeacherDashboardMobile(),
                  // Add a button to toggle the sidebar
                ],
              );
            }
          },
        )
    );
  }
}
