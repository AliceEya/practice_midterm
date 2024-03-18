import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pasadong_midterm/homescreen.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  final formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var email = TextEditingController();


  //fetchching the data
  // void fetchUserData() async {
  //   try {
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       DocumentSnapshot<Map<String, dynamic>> snapshot =
  //       await  FirebaseFirestore.instance.collection('users').doc(user.uid).get();
  //       if (snapshot.exists) {
  //         Map<String, dynamic> data = snapshot.data()!;
  //         setState(() {
  //           firstNameController.text = data['firstName'];
  //           lastNameController.text = data['lastName'];
  //         });
  //       }
  //     }
  //   } catch (e) {
  //     print('Error fetching user data: $e');
  //   }
  // }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData () async{
    try{
      User? user = FirebaseAuth.instance.currentUser;
      if (user!=null){
        email.text = user.email!;
        DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if(snapshot.exists){
          Map<String,dynamic> data = snapshot.data()!;
          setState(() {
            firstNameController.text = data ['firstName'];
            lastNameController.text = data['lastName'];
          });
        }
      }
    }catch (error){
      EasyLoading.showError('$error');
    }
  }

Future<void>_updateData () async{
  try{
    EasyLoading.show(status: 'Updating');
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null){
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'firstName' : firstNameController.text,
      'lastName' : lastNameController.text,
    });
        EasyLoading.dismiss();
  }
    }
  catch(error){
    EasyLoading.showError('$error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      actions: [
        //signout
        IconButton(onPressed: ()async{
             await FirebaseAuth.instance.signOut();
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Homescreen()));
        }, icon: Icon(Icons.logout))  
      ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
              TextFormField(
              controller: email,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                  labelText: 'First Name', border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                  labelText: 'Last Name', border: OutlineInputBorder()),
            ),
            ElevatedButton(onPressed: _updateData, child: Text('Update')),

          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (_, snapshot){
                if(snapshot.data == null){
                    return Text('No data');
                } final documents = snapshot.data!.docs;
               return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (_,index){
                  return ListTile(
                    title: Text('${documents[index]['firstName']} ${documents[index]['lastName']}'),
                  );
                });
              }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
