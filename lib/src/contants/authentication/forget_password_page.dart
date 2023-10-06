import 'package:flutter/material.dart';

import '../../features/views/students_views/student mobile view/forget_password_mobile.dart';
import '../../features/views/students_views/student_desktop view/forget_password_desktop.dart';




class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Desktop view
            return ForgetPasswordDesktop();
          } else {
            // Mobile view
            return ForgetPasswordMobile();
          }
        },
      ),
    );
  }
}
