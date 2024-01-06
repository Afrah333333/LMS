import 'package:flutter/material.dart';

import '../../../../contants/authentication/login_form.dart';


class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Picture
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://www.avanse.com/blogs/images/10feb-blog-2023.jpg"),
                  fit: BoxFit.cover
                  // fit: BoxFit.scaleDown
                )
            ),
          ),
          // Login Form
          Container(

            decoration: BoxDecoration(
                color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.35,
            padding: EdgeInsets.all(20),
            child: LoginForm(),
          ),
        ],
      ),
    );

  }
}
