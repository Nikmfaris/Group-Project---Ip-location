import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iplocation/auth/log_or_reg.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedLayerButton(
              onClick: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LogReg()),
                );
              },
              buttonHeight: 40,
              buttonWidth: 100,
              animationDuration: const Duration(milliseconds: 200),
              animationCurve: Curves.ease,
              topDecoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
              ),
              topLayerChild: const Text("Logout"),
              baseDecoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            if (user != null) ...[
              Center(
                child: Text(
                  'Hello, ${user.email}',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  'Bai Bai !!',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
            ] else ...[
              const Center(
                child: Text(
                  'No user is currently logged in.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
