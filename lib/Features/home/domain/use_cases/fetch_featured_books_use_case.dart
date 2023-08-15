import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/Features/home/domain/repos/home_repo.dart';
import 'package:book_hunt/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/use_cases.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
