import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../repository/controllers/signup_controller.dart';
import '../color/text.dart';

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final controller = Get.put(SignUpController());
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(

        controller: controller.password,
          obscureText: _obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return passError1;
            }
            if (value.length < 6) {
              return passError2;
            }
            // Add any additional password validation logic here, such as requiring specific characters or patterns

            return null; // Return null if the password is valid
          },
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          labelText: password,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.black,
                ),
              ),
        ),
      ),
    );
  }
}
