import 'dart:ffi';

class cData {
  String name;
  String email;
  String phone;
  String address;
  String city;
  String created_at;
  String updated_at;

  cData({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.created_at,
    required this.updated_at,
  });

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        city: json['city'],
        created_at: json['created_at'],
        updated_at: json['updated_at']);
  }
}
