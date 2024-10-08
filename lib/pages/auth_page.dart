import 'package:commerce/components/log_in_or_register_page.dart';
import 'package:commerce/home_page.dart';
import 'package:commerce/pages/user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LogInOrRegisterPage();
          }
        },
      ),
    );
  }
}
