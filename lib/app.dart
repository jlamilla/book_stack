import 'package:book_stack/config/router/router_pages.dart';
import 'package:book_stack/config/services/theme.dart';
import 'package:book_stack_design_system/designs/atomic/theme/book_stack_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookStackApp extends ConsumerWidget {
  const BookStackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ThemeMode> themeModeAsync = ref.watch(themeNotifierProvider);
    final ThemeMode themeMode = themeModeAsync.value ?? ThemeMode.system;

    return MaterialApp.router(
      routerConfig: Pages.appRouter,
      debugShowCheckedModeBanner: false,
      theme: BookStackTheme().lightTheme(),
      darkTheme: BookStackTheme().darkTheme(),
      themeMode: themeMode,
    );
  }
}
