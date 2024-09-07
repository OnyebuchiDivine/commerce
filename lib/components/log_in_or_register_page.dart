import 'package:commerce/pages/sign_up_page.dart';
import 'package:commerce/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class LogInOrRegisterPage extends StatefulWidget {
  const LogInOrRegisterPage({super.key});

  @override
  State<LogInOrRegisterPage> createState() => _LogInOrRegisterPageState();
}

class _LogInOrRegisterPageState extends State<LogInOrRegisterPage> {
  bool showSignInPage = true;

  void togglePages() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignInPage(
        onTap: togglePages,
      );
    } else {
      return SignUpPage(
        onTap:togglePages,
      );
    }
  }
}
