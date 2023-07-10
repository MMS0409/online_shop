// "address": {},
// "id": 1,
// "email": "john@gmail.com",
// "username": "johnd",
// "password": "m38rmF$",
// "name": {},
// "phone": "1-570-236-7033",
// "__v": 0

import 'address_model.dart';
import 'name_model.dart';

class UserModel {
  final AddressModel address;
  final int id;
  final String email;
  final String username;
  final String password;
  final NameModel name;
  final String phone;
  final int v;

  UserModel({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        address: AddressModel.fromJson(json["address"]),
        id: json["id"] as int? ?? 0,
        email: json["email"] as String? ?? '',
        username: json["username"] as String? ?? '',
        password: json["password"] as String? ?? '',
        name: NameModel.fromJson(json["name"]),
        phone: json["phone"] as String? ?? '',
        v: json["v"] as int? ?? 0
    );
  }
}