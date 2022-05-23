import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prjct_andie/models/profile.dart';

class DatabaseService{

  final String uid;
  DatabaseService ({required this.uid});

  final CollectionReference userProfile  = FirebaseFirestore.instance.collection('Andie');
  final CollectionReference clientProfile  = FirebaseFirestore.instance.collection('Client');

  Future updateUserData(String name, String bio, String edu, String exp, int contNum,  String email, String uid ) async{
    return await userProfile.doc(uid).set({
      'name': name,
      'bio' : bio,
      'edu' : edu,
      'exp' : exp,
      'contNum' : contNum,
      'email' :email,
      'uid' :uid,

    });
  }

  List <Profile?> _profileListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Profile(
          name: doc.get('name') ?? '',
          bio: doc.get('bio') ?? '',
          edu: doc.get('education') ?? '',
          exp: doc.get('experience') ?? '',
          contNum: doc.get('Contact Number') ?? 0,
          email: doc.get('Email') ?? '',
          uid: doc.get('UID') ?? '',
      );
    }).toList();
  }


  Stream<List <Profile?>?> get profile{
    return userProfile.snapshots()
        .map(_profileListFromSnapshot);
  }


  Future updateUserDataClient(String nameClient, int contNumClient,  String emailClient ) async{
    return await clientProfile.doc(uid).set({
      'name': nameClient,
      'contNum' : contNumClient,
      'email' :emailClient,

    });
  }


  Stream<QuerySnapshot?> get Clientprofile{
    return clientProfile.snapshots();
  }
}