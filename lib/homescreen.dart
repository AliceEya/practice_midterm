import 'package:flutter/material.dart';
import 'package:pasadong_midterm/loginscreen.dart';
import 'package:pasadong_midterm/registration.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homescreen'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed:(){
            Navigator.of(context).pushReplacement
            (MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          child: Text('LOGIN')),
             ElevatedButton(onPressed:(){
            Navigator.of(context).pushReplacement
            (MaterialPageRoute(builder: (_) => Registration()));
            },
          child: Text('REGISTRATION')),
        ],
      ),
    );
  }
}