import 'package:antio_books/config/injection_dependencies/injection_container.dart' as di;
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  await di.init();
  runApp(const AntioBooksApp());
} 