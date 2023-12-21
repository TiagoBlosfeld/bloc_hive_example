import 'package:bloc_package_example/app/app_module.dart';
import 'package:bloc_package_example/app/app_widget.dart';
import 'package:bloc_package_example/shared/core/configs/hive_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await HiveConfig.start();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
