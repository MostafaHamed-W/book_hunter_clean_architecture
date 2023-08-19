import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repos/home_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());
  final HomeRepo homeRepo;
  Future<void> searchBooks({String? searchText}) async {
    emit(SearchBooksLoading());
    var result = await homeRepo.searchBooks(searchText: searchText);
    result.fold(
      (failure) {
        emit(SearchBooksFailure(failure.message));
      },
      (books) {
        emit(SearchBooksSuccess(books));
      },
    );
  }
}
