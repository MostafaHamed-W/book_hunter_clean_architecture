import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }

    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(failure.message));
      } else {
        emit(NewestdBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
