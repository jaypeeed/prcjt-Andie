import 'package:flutter/material.dart';
import 'package:prjct_andie/models/user.dart';
import 'package:prjct_andie/screens/authenticate.dart/authentication.dart';
import 'package:prjct_andie/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
