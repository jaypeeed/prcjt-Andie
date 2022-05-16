import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    
    final profile = Provider.of<QuerySnapshot?>(context);
    if(profile!=null){
      for(var doc in profile.docs){
        print(doc.data);
      }
    }
    //print(profile?.docs);
    return Container();
  }
}
