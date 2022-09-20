import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GoogleAuth extends StatelessWidget {
   GoogleAuth({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

   TextEditingController email = TextEditingController();
   TextEditingController pass = TextEditingController();

  Future googleAuth()async{
    await auth.createUserWithEmailAndPassword(email: email.text, password: pass.text);
    print(auth.currentUser!.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              controller: email,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: pass,
            ),

            ElevatedButton(onPressed: (){
              GoogleAuth();
              print("...........");
            }, child: Text(""))
          ],
        ),
      ),
    );
  }
}
