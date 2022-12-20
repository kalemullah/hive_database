import 'package:flutter/material.dart';

User? user;

class User {
  int? age;
  int? marks;
  String? name;
  User({this.age, this.marks, this.name});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      age: data["age"],
      marks: data["marks"],
      name: data["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "marks": marks,
      };
}
