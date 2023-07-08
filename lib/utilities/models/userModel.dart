class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNo;
  final String? password;
  final String? gender;
  final int? age;
  int? points;
  //List Fav store, List Favourited coupons, List of visited stores

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.password,
    this.gender,
    this.age,
    this.points,
  });

  toJson() {
    //Firestore stores data like this
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'PhoneNo': phoneNo,
      'Password': password,
      'Gender': gender,
      'Age': age,
      'Points': points,
    };
  }
}
