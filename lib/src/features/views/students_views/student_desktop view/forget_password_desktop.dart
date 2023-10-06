import 'package:flutter/material.dart';

import '../student mobile view/forget_password_mobile.dart';



class ForgetPasswordDesktop extends StatefulWidget {
  const ForgetPasswordDesktop({super.key});

  @override
  State<ForgetPasswordDesktop> createState() => _ForgetPasswordDesktopState();
}

class _ForgetPasswordDesktopState extends State<ForgetPasswordDesktop> {
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
                  image: NetworkImage("https://static.the.akdn/53832/1642353085-akes-uganda-img_3155_r.jpg?w=1800&auto=format"),
                  fit: BoxFit.cover,
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
              child: ForgetPasswordWidget()
          ),
        ],
      ),
    );
  }
}
