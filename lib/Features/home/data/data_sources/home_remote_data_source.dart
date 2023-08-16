import 'package:book_hunt/Features/home/data/models/book_model/book_model.dart';
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
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data =
        await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=action&sorting=newest');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['item']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
