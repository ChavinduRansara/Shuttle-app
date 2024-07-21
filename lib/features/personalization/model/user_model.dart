
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String phoneNumber;
  final String uid;
  String? profilePicture; 
  String? address;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.uid,
    this.profilePicture,
    this.address,
  });

  static List<String> nameParts(fullName) => fullName.split(' ');
   
  static UserModel empty() => UserModel(
    name: '',
    email: '',
    phoneNumber: '',
    uid: '',
    profilePicture: '',
    address: '',
  );
  
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;
      return UserModel(
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        uid: data['uid'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
        address: data['address'] ?? '',
      );
    }else{
      return UserModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'profilePicture': profilePicture,
      'address': address,
    };
  }


}