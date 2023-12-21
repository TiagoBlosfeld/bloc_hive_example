import 'package:bloc_package_example/shared/core/services/hive_service.dart';
import 'package:flutter/material.dart';

class HiveConfig {
  static start() async {
    // Deafult config for the App!

    WidgetsFlutterBinding.ensureInitialized();
    await HiveService().initHive();
  }
}
