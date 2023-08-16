import 'package:book_hunt/Features/home/data/models/book_model/book_model.dart';
import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/constants.dart';
import 'package:book_hunt/core/utils/api_service.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/functions.dart';

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
        await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=action&sorting=newest');
    List<BookEntity> books = getBooksList(data);
    //save books to local data source
    saveBooksData(books, kFeaturebBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data =
        await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=action&sorting=newest');
    List<BookEntity> books = getBooksList(data);
    //save books to local data source
    saveBooksData(books, kNewestBox);
    return books;
  }
}
