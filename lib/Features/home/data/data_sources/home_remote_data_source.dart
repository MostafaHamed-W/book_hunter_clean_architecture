import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data =
        await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=fantsy&sorting=newest');
    List<BookEntity> books = [];
    for (var bookMap in data['item']) {
      books.add(bookMap);
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data =
        await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=action&sorting=newest');
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(bookMap);
    }
    return books;
  }
}
