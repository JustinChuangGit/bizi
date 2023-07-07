class UserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNo;
  final String? password;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  toJson() {
    //Firestore stores data like this
    return {
      'FullName': fullName,
      'Email': email,
      'PhoneNo': phoneNo,
      'Password': password,
    };
  }
}
