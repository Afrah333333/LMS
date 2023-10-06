import 'package:flutter/material.dart';

import '../../features/views/admin views/admin desktop view/admin_dashboard_desktop.dart';
import '../../features/views/admin views/admin mobile view/admin_dashboard_mobile.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});


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
                    Expanded(child: AdminDashboardDesktop()),
                ],
              );
            } else {
              // Mobile view
              return Stack(
                children: [
                  AdminDashboardMobile(),
                  // Add a button to toggle the sidebar
                ],
              );
            }
          },
        )
    );
  }
}
