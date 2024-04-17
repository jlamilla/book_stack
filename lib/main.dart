import 'package:flutter/material.dart';

import 'app.dart';
import 'config/injection_dependencies/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const AntioBooksApp());
} 
