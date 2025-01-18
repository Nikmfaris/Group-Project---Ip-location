import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iplocation/auth/log_or_reg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //me: HomePage(),
      home: const LogReg(),

      //MIGHT IMPLEMENT LATE
      // initialRoute: '/home',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/home': (context) => HomePage(),
      //   '/login': (context) => LoginPage(),
      //   '/ipgeo': (context) => IpGeoPage(),
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}
