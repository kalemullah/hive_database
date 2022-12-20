import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:widgets_list/provider/model.dart';

class TestingViewModel extends ChangeNotifier {
  List dataList = [];
  TestingViewModel() {
    init();
  }

  init() async {
    var data = await Hive.openBox("Student");
    dataList = data.values.toList();
    log(dataList.toString());
    notifyListeners();
  }

  update(int index, String name, String age, String address) async {
    var data = await Hive.openBox("Student");
    data.putAt(index, {"name": name, "age": age, "address": address});
    dataList = data.values.toList();
    notifyListeners();
    log(dataList.toString());
  }

  delete(int index) async {
    var data = await Hive.openBox("Student");
    data.deleteAt(index);
    dataList = data.values.toList();
    notifyListeners();
  }

  // LoginBody? loginBody;
  // User? myuser;
  // Map<String, dynamic> data = {
  //   "age": 23,
  //   "marks": 883,
  //   "name": "Arshad khan",
  // };

  // TestingViewModel() {
  //   myuser = User.fromJson(data);
  // }

  // user!.age = 23;
  // user!.name = 'Test User';
  // user!.marks = 352;
  // notifyListeners();

}

class LoginBody {
  String? name;
  String? address;
  LoginBody({this.name, this.address});

  Map<String, dynamic> json() {
    Map<String, dynamic> map = {
      "name": name,
      "address": address,
    };

    return map;
  }
}
