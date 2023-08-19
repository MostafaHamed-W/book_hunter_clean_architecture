import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/constants.dart';
import 'package:book_hunt/core/utils/api_service.dart';

import '../../../../core/utils/functions.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({String? category});
  Future<List<BookEntity>> searchBooks({String? searchText});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=-ebooks&q=subject:action&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    //save books to local data source
    saveBooksData(books, kFeaturebBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:fantasy&Sorting=newest&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    //save books to local data source
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({String? category}) async {
    var data =
        await apiService.get(endPoint: 'volumes?&orderBy=newest&q=subject:${category ?? 'action'}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> searchBooks({String? searchText}) async {
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=$searchText');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
