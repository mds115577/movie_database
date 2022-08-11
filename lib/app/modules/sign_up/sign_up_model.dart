import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  String? uid;
  String? email;
  String? name;
  String? age;
  String? number;
  Timestamp? s;
  DataModel({this.uid, this.email, this.name, this.age, this.number, this.s});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'Name': name,
      'age': age,
      'Number': number,
      'created At': s
    };
  }
}
















  // factory DataModel.fromMap(map) {
  //   return DataModel(
  //     image: map['image'],
  //     uid: map['uid'],
  //     email: map['email'],
  //     Name: map['Name'],
  //     age: map['age'],
  //     Number: map['Number'],
  //   );
  // }