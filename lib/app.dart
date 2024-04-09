import 'package:antio_books/config/injection_dependencies/providers_register.dart';
import 'package:antio_books/config/router/app_router.dart';
import 'package:antio_books/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AntioBooksApp extends StatelessWidget {
  const AntioBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersUseCase,
      child: MaterialApp.router(
        routerConfig: appRouter,  
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}