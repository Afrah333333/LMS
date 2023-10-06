import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:online_learning_platform/src/common_widgets/students/student_dashboard.dart';
import 'package:online_learning_platform/src/contants/authentication/login_page.dart';

import '../models/user_model.dart';
import '../user_repo/user_repository.dart';
import 'exceptions/signup_email_password_failure.dart';


class AuthentificationRepository extends GetxController {
  static AuthentificationRepository get instance => Get.find();

  // variables
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final UserRepo = Get.put(UserRepository());

  // var verificationId = ''.obs;

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 5));
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setIniationScreen);
  }

  Future<void> setIniationScreen(User? user) async {
    if (user != null) {
      // Check if the user has the admin role.
      QuerySnapshot adminSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('Email', isEqualTo: user.email)
          .where('Role', isEqualTo: 'admin')
          .get();

      if (adminSnapshot.docs.isNotEmpty) {
        // The current user has the admin role.
        // Navigate to the admin dashboard.
        // Get.to(() => AdminNavbar());
        return;
      }

      // The current session is not for an admin user.
      // Check the user's role and navigate to the corresponding screen.
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('Email', isEqualTo: user.email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot userSnapshot = snapshot.docs[0];
        String userRole = userSnapshot['Role'];

        switch (userRole) {
          case 'student':
          // Get.to(() => LawyerHomePage());
            break;
          case 'lecturer':
            // Get.to(() => LawyerHomePage());
            break;
          case 'admin':
            // Get.to(() => PoliceHomePage());
            break;
          default:
            print("There is an error, go to welcome screen");
            Get.to(() => LoginPage());
            break;
        }
      } else {
        print("User is null");
        Get.to(() => LoginPage());
        // Handle the case when the user is null
      }
    } else {
      print("User is null");
      Get.to(() => LoginPage());
      // Handle the case when the user is null
    }
  }







  Future<void> createUserWithEmailAndPassword(
      String email, String password, UserModel user) async {
    try {
      CircularProgressIndicator();
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => StudentDashboard()) : Get.offAll(() => const LoginPage());
      await UserRepo.createUser(user);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION -${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
  }





// log out function
  Future<void> logout() async => await auth.signOut();
}
