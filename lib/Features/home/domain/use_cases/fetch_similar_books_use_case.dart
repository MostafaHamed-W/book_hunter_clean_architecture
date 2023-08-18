import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/Features/home/domain/repos/home_repo.dart';
import 'package:book_hunt/core/errors/failure.dart';
import 'package:book_hunt/core/utils/use_cases.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String?> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) async {
    return await homeRepo.fetchSimilarBooks(category: param);
  }
}
