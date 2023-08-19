import 'package:book_hunt/Features/home/presentation/views/widgets/shimmers/newest_books_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/pagination_error.dart';
import '../../../domain/enitities/book_entity.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'book_listview_item.dart';

class NewestBooksSliver extends StatefulWidget {
  const NewestBooksSliver({
    super.key,
  });

  @override
  State<NewestBooksSliver> createState() => _NewestBooksSliverState();
}

class _NewestBooksSliverState extends State<NewestBooksSliver> {
  List<BookEntity> allBooks = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          allBooks.addAll(state.books);
        }
        if (state is NewestdBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarPaginationError(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestdBooksPaginationFailure) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return BookListViewItem(
                  book: allBooks[index],
                );
              },
              childCount: allBooks.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverList(
            delegate: SliverChildListDelegate(
              [Text(state.errMessage)],
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: NewestBooksListShimmer(),
            ),
          );
        }
      },
    );
  }
}
