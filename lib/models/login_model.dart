// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Login extends ChangeNotifier {
//   final String? login;
//   final String? password;
//   final String? firstName;
//   final String? lastName;
//   final String? email;
//   final String? wasBorn;

//   Login(
//       {this.firstName,
//       this.lastName,
//       this.email,
//       this.wasBorn,
//       this.login,
//       this.password});

//   factory Login.fromJson(Map<String, dynamic> json) {
//     return Login(
//       login: json['login'],
//       password: json['password'],
//       email: json['email'],
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       wasBorn: json['wasBorn'],
//     );
//   }

//   Future<List<Login>> getData() async {
//     var response = await http.get(
//       Uri.parse(
//         'https://localhost:7118/api/Contacts/Contact/GetByLoginAndPassword/murodali/murodali',
//       ),
//     );
//     if (response.statusCode == 200) {
//       return List<Login>.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Sorry Error!');
//     }
//   }

//   @override
//   notifyListeners();
// }
