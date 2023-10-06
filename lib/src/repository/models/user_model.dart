
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

final _db = FirebaseFirestore.instance;

class UserModel {
  String uid;
  final String fullname;
  final String email;
  String role;
  String fcmToken;

  UserModel({
    this.uid = '',
    required this.fullname,
    required this.email,
    this.role = 'user',
    this.fcmToken = '',
  });

  toJson() {
    return {
      "uid": uid,
      "Fullname": fullname,
      "Email": email,
      "Role": role,
      "fcmToken": fcmToken,
    };
  }

  factory UserModel.fromSnapshot(dynamic snapshot) {
    final data = snapshot.data()!;
    return UserModel(
      uid: snapshot.id,
      fullname: data['Fullname'],
      email: data['Email'],
      role: data['Role'] ?? 'user',
      fcmToken: data['fcmToken'] ?? '',
    );
  }

  void generateRandomFCMToken() {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    const tokenLength = 20;

    String token = '';

    for (var i = 0; i < tokenLength; i++) {
      token += chars[random.nextInt(chars.length)];
    }

    fcmToken = token;
  }
}


