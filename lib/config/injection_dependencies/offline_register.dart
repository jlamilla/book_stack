import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/book.dart';
import 'injection_container.dart';

Future<void> registerOffline() async{

  await Hive.initFlutter();
  
  Hive.registerAdapter(BookAdapter());
  final Box<Book> boxBooks = await Hive.openBox<Book>('bookHistory');
  sl.registerLazySingleton<Box<Book>>(
    () => boxBooks,
  );
}
