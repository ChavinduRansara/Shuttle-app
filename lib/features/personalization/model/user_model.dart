
class UserModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String uid;
  final String? profilePicture; 

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.uid,
    this.profilePicture,
  });

  static List<String> nameParts(fullName) => fullName.split(' ');
   
  static UserModel empty() => UserModel(
    name: '',
    email: '',
    phoneNumber: '',
    uid: '',
    profilePicture: '',
  );
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      uid: json['uid'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'profilePicture': profilePicture,
    };
  }
}