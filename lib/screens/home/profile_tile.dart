import 'package:flutter/material.dart';
import 'package:prjct_andie/models/profile.dart';

class ProfileTile extends StatelessWidget {

  final Profile profile;
  ProfileTile({required this.profile});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.black,
          ),
          title: Text(profile.name),
          subtitle: Text('profile.contNum.toString()'),
        ),
      ),
    );
  }
}
