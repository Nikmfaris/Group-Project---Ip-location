import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:math';
import 'package:iplocation/components/my_textfield.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';

class PassGenPage extends StatefulWidget {
  @override
  _PassGenPageState createState() => _PassGenPageState();
}

class _PassGenPageState extends State<PassGenPage> {
  final TextEditingController _passwordController = TextEditingController();
  String _result = '';

  void _applyRot13() {
    setState(() {
      _result = _rot13(_passwordController.text);
    });
  }

  void _applySha1() {
    setState(() {
      _result = _sha1(_passwordController.text);
    });
  }

  void _generateRandomPassword() {
    setState(() {
      _result = _randomPassword();
    });
  }

  String _rot13(String input) {
    return input.replaceAllMapped(RegExp(r'[A-Za-z]'), (Match match) {
      String char = match.group(0)!;
      int code = char.codeUnitAt(0);
      if (code >= 'a'.codeUnitAt(0) && code <= 'z'.codeUnitAt(0)) {
        return String.fromCharCode(
            (code - 'a'.codeUnitAt(0) + 13) % 26 + 'a'.codeUnitAt(0));
      } else if (code >= 'A'.codeUnitAt(0) && code <= 'Z'.codeUnitAt(0)) {
        return String.fromCharCode(
            (code - 'A'.codeUnitAt(0) + 13) % 26 + 'A'.codeUnitAt(0));
      }
      return char;
    });
  }

  String _sha1(String input) {
    var bytes = utf8.encode(input);
    var digest = sha1.convert(bytes);
    return digest.toString();
  }

  String _randomPassword({int length = 12}) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: MyTextfield(
                    hintText: "Enter Password",
                    obscureText: false,
                    controller: _passwordController),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedLayerButton(
                      onClick: _applyRot13,
                      buttonHeight: 60,
                      buttonWidth: 120,
                      animationDuration: const Duration(milliseconds: 200),
                      animationCurve: Curves.ease,
                      topDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                      ),
                      topLayerChild: Text('Apply ROT13'),
                      baseDecoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        border: Border.all(),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedLayerButton(
                      onClick: _applySha1,
                      buttonHeight: 60,
                      buttonWidth: 120,
                      animationDuration: const Duration(milliseconds: 200),
                      animationCurve: Curves.ease,
                      topDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                      ),
                      topLayerChild: Text('Apply SHA-1'),
                      baseDecoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        border: Border.all(),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedLayerButton(
                      onClick: _generateRandomPassword,
                      buttonHeight: 60,
                      buttonWidth: 120,
                      animationDuration: const Duration(milliseconds: 200),
                      animationCurve: Curves.ease,
                      topDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                      ),
                      topLayerChild: Text('Random'),
                      baseDecoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        border: Border.all(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.white,
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Result: $_result',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
