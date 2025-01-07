import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iplocation/auth/log_or_reg.dart';
import 'package:iplocation/components/my_button.dart';
import 'package:iplocation/components/my_textfield.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  void register() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    //make sure password match
    if (passwordcontroller.text != confirmPassController.text) {
      //show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: Colors.red,
        ),
      );
      //close loading circle
      Navigator.pop(context);
      return;
    }
    //if password match
    else {
      //try creating user
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text);
        //pop loading circle
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User successfully created"),
            backgroundColor: Colors.green,
          ),
        );
        //await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogReg()),
        );
      } on FirebaseAuthException catch (e) {
        //show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFF121212), // Set the background color to black (121212)
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
                const Text("R E G I S T E R",
                    style: TextStyle(fontSize: 30, color: Colors.green)),
                const SizedBox(height: 20),
                //username textfield
                MyTextfield(
                    hintText: "username",
                    obscureText: false,
                    controller: usernamecontroller),
                const SizedBox(height: 10),

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

                //confirm password textfield
                MyTextfield(
                    hintText: "confirm password",
                    obscureText: true,
                    controller: confirmPassController),
                const SizedBox(height: 10),

                //forgot password
                Row(
                  children: [
                    Text("forgot password?",
                        style: TextStyle(color: Colors.green, fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 25),

                //register button
                MyButton(text: "register", onTap: register),

                //dont have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(color: Colors.green, fontSize: 15)),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("  login here",
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
