import 'package:antio_books/config/injection_dependencies/data_sources_register.dart';
import 'package:antio_books/config/injection_dependencies/offline_register.dart';
import 'package:antio_books/config/injection_dependencies/repositories_register.dart';
import 'package:antio_books/config/injection_dependencies/use_cases_register.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async{
  await registerOffline();
  registerDataSources();
  registerRepositories();
  registerUseCases();
}
