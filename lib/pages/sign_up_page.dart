import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/components/my_button.dart';
import 'package:commerce/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;

  SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  final firstnameController = TextEditingController();

  final lastnameController = TextEditingController();

  final ageController = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
            
             // User details
      addUserDetails(
        firstnameController.text.trim(),
        lastnameController.text.trim(),
        emailController.text.trim(),
        int.parse(ageController.text.trim()),
      );

      } else {
        showErrorMessage("Passwords don't match!");
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessage(e.code);

     
    }
  }

  Future addUserDetails(
      String firstname, String lastname, String email, int age) async {
    await FirebaseFirestore.instance.collection('info').add({
      'first name': firstname,
      'last name': lastname,
      'age': age,
      'email': email,
    });
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sign In',
            style: TextStyle(color: const Color.fromARGB(255, 125, 211, 128)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              // first name
              MyTextfield(
                controller: firstnameController,
                hintText: "first name ",
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              // lastname
              MyTextfield(
                controller: lastnameController,
                hintText: "last name",
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              // Age
              MyTextfield(
                controller: ageController,
                hintText: "age",
                obscureText: false,
              ),

              SizedBox(
                height: 20,
              ),
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              MyTextfield(
                controller: confirmpasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                  Text("Or"),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account"),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Sign In Now",
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
