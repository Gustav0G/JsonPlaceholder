class UserModel {
  int id;
  String name;
  String email;
  Map address = {};
  String phone;
  String website;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['username'],
        address: json['address'],
        phone: json['phone'],
        website: json['website']);
  }
}
