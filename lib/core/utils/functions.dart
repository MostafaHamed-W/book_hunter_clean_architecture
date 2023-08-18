import 'package:hive/hive.dart';

import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/domain/enitities/book_entity.dart';

void saveBooksData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  // ?? [] to avoid error if there are no similar books in the list
  for (var bookMap in data['items'] ?? []) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}
