import 'package:flutter/material.dart';
import 'package:prjct_andie/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[50],
      appBar: AppBar(
        title: Text('Andie'),
        backgroundColor: Colors.orangeAccent[400],
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton(
            child: Text('Log out'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
