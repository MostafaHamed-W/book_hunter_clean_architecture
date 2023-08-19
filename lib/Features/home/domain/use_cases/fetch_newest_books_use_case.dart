import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/Features/home/domain/repos/home_repo.dart';
import 'package:book_hunt/core/errors/failure.dart';
import 'package:book_hunt/core/utils/use_cases.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fetchNewestBooks(
      pageNumber: param,
    );
  }
}
