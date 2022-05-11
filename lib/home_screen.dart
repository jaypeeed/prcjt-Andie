import 'package:flutter/material.dart';
import 'auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You are logged in'),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              AuthService().signOut();
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: const Center(
              child: Text('Sign out'),
            ),
          )
        ],
      ),
    );
  }
}
