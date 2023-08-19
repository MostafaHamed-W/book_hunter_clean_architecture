import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({String? category});
  Future<Either<Failure, List<BookEntity>>> searchBooks({String? searchText});
}
