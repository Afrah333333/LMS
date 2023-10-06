import 'package:flutter/material.dart';

import '../../../../contants/authentication/login_page.dart';
import '../../../../contants/color/color.dart';


class ForgetPasswordMobile extends StatefulWidget {
  const ForgetPasswordMobile({super.key});

  @override
  State<ForgetPasswordMobile> createState() => _ForgetPasswordMobileState();
}

class _ForgetPasswordMobileState extends State<ForgetPasswordMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          color: Colors.green,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),

            padding: EdgeInsets.all(20),
            child: ForgetPasswordWidget(),
          ),
        )
    );
  }
}

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/log.png"), width: 150, height: 150),
            SizedBox(height: 10),
            Text(
              'Password Recovery',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text(

                  'Enter your account\'s email and we\'ll send you an email to reset the password',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(

            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
            },
            child: Text('Login Instead', style: TextStyle(color: Colors.green),),
          ),
        ),
      ],
    );
  }
}
