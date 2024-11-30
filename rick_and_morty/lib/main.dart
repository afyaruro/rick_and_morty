import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/config.dart';

void main() async {
  StartDependency startDependency = StartDependency();
  await startDependency.init();

  runApp(const MyApp());
}
