import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService ({required this.uid});

  final CollectionReference userProfile  = FirebaseFirestore.instance.collection('profile');
  final CollectionReference clientProfile  = FirebaseFirestore.instance.collection('Clientprofile');

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

  Future updateUserDataClient(String nameClient, int contNumClient,  String emailClient ) async{
    return await clientProfile.doc(uid).set({
      'name': nameClient,
      'contNum' : contNumClient,
      'email' :emailClient,

    });
  }

  Stream<QuerySnapshot?> get profile{
    return userProfile.snapshots();
  }

  Stream<QuerySnapshot?> get Clientprofile{
    return clientProfile.snapshots();
  }
}