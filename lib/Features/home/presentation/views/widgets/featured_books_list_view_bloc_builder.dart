import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/pagination_error.dart';
import '../../manager/featured_book_cubit/featured_books_cubit.dart';
import 'books_list_view.dart';
import 'featurer_books_loading_indicator.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() => _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> allBooks = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          allBooks.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarPaginationError(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return BooksListView(books: allBooks);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(
            child: FeaturedBooksLoadingIndicator(),
          );
        }
      },
    );
  }
}
