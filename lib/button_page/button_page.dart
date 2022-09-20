import 'package:d_auth/google_auth/auth_service.dart';
import 'package:d_auth/my_auth/my_auth.dart';
import 'package:flutter/material.dart';


class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const MyAuth()));
            }, child: const Text("Phone")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AuthService().handleAuthState()));
            }, child: const Text("Google")),

          ],
        ),
      ),
    );
  }
}
