import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/config/config.dart';

void main() async {
  StartDependency startDependency = StartDependency();
  await Hive.initFlutter();
  await startDependency.init();

  runApp(const MyApp());
}
