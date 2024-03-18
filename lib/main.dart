import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pasadong_midterm/firebase_options.dart';
import 'package:pasadong_midterm/homescreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MidtermApp());
}

class MidtermApp extends StatelessWidget {
  const MidtermApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
      builder: EasyLoading.init(),
    );
  }
}