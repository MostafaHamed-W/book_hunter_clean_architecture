import 'package:bloc/bloc.dart';
import 'package:book_hunt/Features/home/data/repos/home_repo_impl.dart';
import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/core/errors/failure.dart';
import 'package:flutter/cupertino.dart';

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
