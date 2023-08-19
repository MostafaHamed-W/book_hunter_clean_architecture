import 'package:book_hunt/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_hunt/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/Features/home/domain/repos/home_repo.dart';
import 'package:book_hunt/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeLocalDataSource, this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({String? category}) async {
    try {
      List<BookEntity> books;
      books = await homeRemoteDataSource.fetchSimilarBooks(category: category);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({String? searchText}) async {
    try {
      List<BookEntity> books = await homeRemoteDataSource.searchBooks(searchText: searchText);
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
