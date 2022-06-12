import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tester extends StatefulWidget {
  const tester({Key? key}) : super(key: key);

  @override
  State<tester> createState() => _testerState();
}

class _testerState extends State<tester> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      color: Colors.red,
      child: Text('TEST PASSED'),
    );
  }
}
