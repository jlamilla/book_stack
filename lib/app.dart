import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/injection_dependencies/providers_register.dart';
import 'config/router/router_pages.dart';
import 'config/theme/app_theme.dart';

class AntioBooksApp extends StatelessWidget {
  const AntioBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersUseCase,
      child: MaterialApp.router(
        routerConfig: Pages.appRouter,  
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
