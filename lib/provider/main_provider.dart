import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class MainProvider {
  String name = "Arshad";
}

GetIt locator = GetIt.instance;

setLocator() {
  locator.registerSingleton(MainProvider());

  log("AuthServices registered");
}
