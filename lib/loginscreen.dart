import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pasadong_midterm/dashboard.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen ({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
     bool showPassword = true;



void login () async {
  if(formKey.currentState!.validate()){
    EasyLoading.show(status: 'Processing');
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text);
    EasyLoading.dismiss();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Dashboard()));
  } catch (error){
    EasyLoading.showError('$error');
  }
  }
}


  void toggle(){
    setState(() {
    showPassword = !showPassword;
    });
  }


return Scaffold(
      appBar: AppBar(
        title: Text('Midterms'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder()
              ),
              validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Required';
                  } return null;
              },
            ),
            TextFormField(
              obscureText: showPassword,
              controller: passwordController,
              decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: toggle,
                  icon:  Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off)),
                label: Text('Password'),
                border: OutlineInputBorder()
              ),
               validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Required';
                  } return null;
              },
            ),
            ElevatedButton(onPressed: login, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}