

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String profileImage;
  final int totalScore;
  final int quizzesTaken;
  final int highestScore;
  final DateTime? createdAt;


  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.profileImage = '',
    this.totalScore = 0,
    this.quizzesTaken = 0,
    this.highestScore = 0,
    this.createdAt,
  
  });


  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profileImage': profileImage,
      'totalScore': totalScore,
      'quizzesTaken': quizzesTaken,
      'highestScore': highestScore,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profileImage'] ?? '',
      totalScore: map['totalScore'] ?? 0,
      quizzesTaken: map['quizzesTaken'] ?? 0,
      highestScore: map['highestScore'] ?? 0,
      createdAt: map['createdAt'] != null ? (map['createdAt'] as Timestamp).toDate() : null,

    );
  }
}
