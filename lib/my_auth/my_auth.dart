import 'package:d_auth/my_auth/my_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAuth extends StatefulWidget {
  const MyAuth({Key? key}) : super(key: key);

  @override
  State<MyAuth> createState() => _MyAuthState();
}

class _MyAuthState extends State<MyAuth> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneCont = TextEditingController();
  TextEditingController otpCont = TextEditingController();
  String? verificationId;

  Future phoneAuth() async {
    // ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber('+91${phoneCont.text}');
    // UserCredential userCredential = await confirmationResult.confirm(otpCont.text);

    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneCont.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        print("ccccccccccc");
        print("$credential ....................");
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String? v, int? resendToken) async {
        print("@@@@@@@@@@@@");

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Enter OTP"),
                actions: [
                  TextField(
                    controller: otpCont,
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: otpCont.text);
                        await auth.signInWithCredential(credential);
                        // ignore: use_build_context_synchronously
                        if (verificationId != null) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const MyPage()));
                          print("VerificationID $verificationId -----------------");
                        }
                      },
                      child: const Text("Send"))
                ],
              );
            });
      },
      codeAutoRetrievalTimeout: (String v) {
        print("*************** $v");
        verificationId = v;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: phoneCont,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  phoneAuth();
                  print("SEND");
                  print(phoneCont.text);
                },
                child: const Text("Send"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
