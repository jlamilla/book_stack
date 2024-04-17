import 'package:get_it/get_it.dart';

import 'data_sources_register.dart';
import 'offline_register.dart';
import 'repositories_register.dart';
import 'use_cases_register.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async{
  await registerOffline();
  registerDataSources();
  registerRepositories();
  registerUseCases();
}
