import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'dart:typed_data';
import 'dart:html' as html;

import 'package:online_learning_platform/src/contants/authentication/password_field.dart';

class AdminRegisteryDesktop extends StatefulWidget {
  const AdminRegisteryDesktop({super.key});

  @override
  State<AdminRegisteryDesktop> createState() => _AdminRegisteryDesktopState();
}

class _AdminRegisteryDesktopState extends State<AdminRegisteryDesktop> {
  Uint8List? selectedImageBytes;

  Future<void> selectImage() async {
    if (kIsWeb) {
      final html.FileUploadInputElement input = html.FileUploadInputElement()..accept = 'image/*';
      input.click();
      input.onChange.listen((e) {
        final html.File file = input.files![0];
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);
        reader.onLoadEnd.listen((event) {
          if (reader.readyState == html.FileReader.DONE) {
            setState(() {
              selectedImageBytes = Uint8List.fromList(reader.result as List<int>);
            });
          }
        });
      });
    } else {
      final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 10);
      if (file != null) {
        setState(() async {
          selectedImageBytes = await file.readAsBytes();
        });
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Software Development';

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 80),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Register Student!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text("Create Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0), // Remove padding to make it a circle
                                  shape: CircleBorder(),
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  // Handle the second button's action
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Text("1", style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text("Personal Details",style: TextStyle(fontWeight: FontWeight.bold) ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        selectImage();
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                          image: selectedImageBytes != null
                              ? DecorationImage(
                            image: MemoryImage(selectedImageBytes!),
                            fit: BoxFit.cover,
                          )
                              : null,
                        ),
                        child: selectedImageBytes == null
                            ? Icon(Icons.add_photo_alternate, size: 50)
                            : null,
                      ),
                    ),
                    Form  (
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  // controller: controller.fullName,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline_outlined),
                                    labelText: "Full Name",
                                  ),
                                ),
                              ),
                              SizedBox(width: 25), // Add some space between the text fields
                              Expanded(
                                child: TextFormField(
                                  // controller: controller.email,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    labelText: "Email",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(child: PasswordTextField(),),
                              const SizedBox(width: 25),
                              Expanded(
                                  child: DropdownButtonFormField<String>(

                                    value: dropdownValue,
                                    dropdownColor: Colors.white,

                                    decoration: InputDecoration(

                                      labelText: 'Select an option', // Optional label
                                      // border: OutlineInputBorder(),   // Optional border styling
                                      contentPadding: EdgeInsets.all(6),

                                    ),
                                    items: <String>[
                                      'Software Development',
                                      'Literature',
                                      'Languages',
                                      'LawTech',
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(

                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                  )

                              ),


                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black,
                                side: BorderSide(color: Colors.black),
                                padding: EdgeInsets.symmetric(vertical: 20),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   PageRouteBuilder(
                                //     pageBuilder: (context, animation, secondaryAnimation) => SignUpPageTwo(),
                                //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                //       return FadeTransition(opacity: animation, child: child);
                                //     },
                                //   ),
                                // );

                              },
                              child: Text("Next"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Align (
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      //       return FadeTransition(opacity: animation, child: child);
                      //     },
                      //   ),
                      // );

                    },
                    child: Text('Already have an account? Login'),
                  ),
                ),
            ],
          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
