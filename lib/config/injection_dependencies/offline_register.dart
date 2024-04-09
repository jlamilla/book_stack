import 'package:antio_books/config/constants/boxes.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> registerOffline() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  boxBooks = await Hive.openBox<Book>('bookHistory'); 
}

