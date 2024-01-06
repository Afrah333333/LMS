import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_learning_platform/src/contants/authentication/password_field.dart';

import '../../repository/controllers/signup_controller.dart';
import '../navbar/admin_sidebar.dart';
import '../navbar/student_sidebar.dart';
import '../navbar/teacher_sidebar.dart';
import 'forget_password_page.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/educate.jpg"), width: 150, height: 150),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null; // Return null if the email is valid
                },
              ),
              SizedBox(height: 10),
              PasswordTextField(),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => ForgetPasswordPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );

                  },
                  child: Text('Forgot Password?', style: TextStyle(color: Colors.green),),
                ),
              ),




            ],
          ),
          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(vertical: 20)
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TeacherSidebar(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },

              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
