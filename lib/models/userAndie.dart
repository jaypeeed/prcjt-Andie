import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userAndie {
  String name = '';
  double ratings= 0;
  String email= '';
  String contactNumber= '';
  List<String> skills= [];
  String experience= '';
  String school= '';
  String years= '';
  int age= 0;
  String fb= '';
  String selectedItem= '';
  String phto= '';



  userAndie(
      this.name,
    this.ratings,
    this.email,
    this.contactNumber,
    this.skills,
    this.experience,
    this.school,
    this.years,
    this.age,
    this.fb,
    this.selectedItem,
    this.phto,
  );
userAndie.fromMap(Map<String, dynamic> data){
  name = data['name'];
  ratings= data['ratings'];
  email= data['email'];
  contactNumber= data['contactNumber'];
  skills=data['skills'];
  experience=data['experience'];
  school= data['school'];
  years= data['yearsOfWork'];
  age= data['age'];
  fb= data['facebook'];
  selectedItem=data['gender'];
  phto= data['photo'];



}
  Map<String, dynamic> ledgerItem(String clientUID, String note, String clientName) {

    return {
      'ledger': FieldValue.arrayUnion([
        {
          "date": DateTime.now(),
          "clientUID": clientUID,
          "clientName": clientName,
          "note": note,

        },
      ]),
    };
  }


}
