import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}
