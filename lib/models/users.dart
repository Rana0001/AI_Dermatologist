class Users {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? gender;
  String? date;
  String? profileUrl;

  Users(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.gender,
      this.date,
      this.profileUrl});

  Users.fromJson(Map<String, dynamic>? json) {
    id = json!['id'] as String? ?? '';
    firstName = json['firstName'] as String? ?? '';
    lastName = json['lastName'] as String? ?? '';
    email = json['email'] as String? ?? '';
    date = json['date'] as String? ?? '';
    gender = json['gender'] as String? ?? '';
    phone = json['phone'] as String? ?? '';
    profileUrl = json['profileUrl'] as String? ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',
      'firstName': firstName ?? '',
      'lastName': lastName ?? '',
      'email': email ?? '',
      "date": date ?? '',
      "gender": gender ?? '',
      'phone': phone ?? '',
      'profileUrl': profileUrl ?? '',
    };
  }
}
