import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {


    final formKey = GlobalKey<FormState>();
    var email = TextEditingController();
    var password = TextEditingController();
    var firstName = TextEditingController();
    var lastName = TextEditingController();

void r () async {
  if (!formKey.currentState!.validate()){
    return;
  }
  EasyLoading.show(status: 'Registering');
  try{
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text);
      String user_id = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(user_id).set({
        'firstName': firstName.text,
        'lastName' : lastName.text,
      });
  EasyLoading.dismiss();  
  } catch (error){
    EasyLoading.showError('$error');
  }
}


    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Required';
                } 
              },
            ),
            TextFormField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder()
              ),
         validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Required';
                }
              },      
            ),
                TextFormField(
                  controller: firstName,
              decoration: InputDecoration(
                label: Text('First Name'),
                border: OutlineInputBorder()
              ),
               validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Required';
                } 
              },
            ),
                TextFormField(
                  controller: lastName,
              decoration: InputDecoration(
                label: Text('Last Name'),
                border: OutlineInputBorder()
              ),
               validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Required';
                } 
              },
            ),
          ElevatedButton(onPressed: r, child: Text('Register'))
          ],
        ),
      ),
    );
  }
}