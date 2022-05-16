import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService ({required this.uid});

  final CollectionReference userProfile  = FirebaseFirestore.instance.collection('profile');

  Future updateUserData(String name, String bio, String edu, String exp, int contNum,  String email ) async{
    return await userProfile.doc(uid).set({
      'name': name,
      'bio' : bio,
      'edu' : edu,
      'exp' : exp,
      'contNum' : contNum,
      'email' :email,

    });
  }
}