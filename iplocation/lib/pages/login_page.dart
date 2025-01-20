import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iplocation/auth/auth.dart';
import 'package:iplocation/components/my_button.dart';
import 'package:iplocation/components/my_textfield.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      //login user
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      //pop loading circle
      Navigator.pop(context);
      //navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFF191919), // Set the background color to black (121212)
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie animation
                Lottie.asset(
                  'assets/login.json',
                  width: 200, // Set the desired width
                  height: 200, // Set the desired height
                ),

                //app name
                const Text("I P  E P S",
                    style: TextStyle(fontSize: 30, color: Colors.green)),
                const SizedBox(height: 20),
                //email textfield
                MyTextfield(
                    hintText: "email",
                    obscureText: false,
                    controller: emailcontroller),
                const SizedBox(height: 10),
                //password textfield
                MyTextfield(
                    hintText: "password",
                    obscureText: true,
                    controller: passwordcontroller),
                const SizedBox(height: 10),
                //forgot password
                Row(
                  children: [
                    Text("forgot password?",
                        style: TextStyle(color: Colors.green, fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 25),
                //sign in button
                MyButton(text: "login", onTap: login),

                //dont have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.green, fontSize: 15)),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("  Register here",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add some padding at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
