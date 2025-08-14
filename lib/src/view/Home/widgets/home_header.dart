import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/bloc/auth_bloc/auth_bloc.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/view/Add-Question_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/src/view/auth/login.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        // Wait for a logged in user
        if (!authSnapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final uid = authSnapshot.data!.uid;

        final userDocStream = FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .snapshots();

        return StreamBuilder<DocumentSnapshot>(
          stream: userDocStream,
          builder: (context, snapshot) {
            // Show loading until doc exists
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: CircularProgressIndicator());
            }

            final userData = snapshot.data!.data() as Map<String, dynamic>;
            final userName = userData['firstName'] ?? '';

            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back,",
                        style: GoogleFonts.josefinSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userName,
                        style: GoogleFonts.josefinSans(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                PopupMenuButton<String>(
                  color: AppColors.backgroundLight,
                  onSelected: (value) async {
                    if (value == 'add') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddQuestionScreen(),
                        ),
                      );
                    } else if (value == 'logout') {
  context.read<AuthBloc>().add(const AuthEvent.logout());
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
}

                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: 'add', child: Text("Add questions")),
                    const PopupMenuItem(
                        value: 'logout', child: Text("Logout")),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
