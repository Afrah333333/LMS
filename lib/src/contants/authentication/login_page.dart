import 'package:flutter/material.dart';

import '../../features/views/students_views/student mobile view/login_mobile.dart';
import '../../features/views/students_views/student_desktop view/login_desktop.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Desktop view
            return LoginDesktop();
          } else {
            // Mobile view
            return LoginMobile();
          }
        },
      ),
    );
  }
}
