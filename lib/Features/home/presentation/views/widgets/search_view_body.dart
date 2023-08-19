import 'package:book_hunt/Features/home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:book_hunt/Features/home/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSearchTextField(),
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Search result', style: Styles.textStyle18),
        ),
        const SizedBox(height: 15),
        BlocBuilder<SearchBooksCubit, SearchBooksState>(
          builder: (context, state) {
            if (state is SearchBooksSuccess) {
              return Expanded(
                child: SearchResultListView(books: state.books),
              );
            } else if (state is SearchBooksFailure) {
              return Text(state.errMessage);
            } else if (state is SearchBooksInitial) {
              return const SearchResultInitialView();
            } else {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        )
      ],
    );
  }
}

class SearchResultInitialView extends StatelessWidget {
  const SearchResultInitialView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 200),
              Icon(
                Icons.search,
                size: MediaQuery.of(context).size.width * 0.25,
                color: Colors.white.withOpacity(0.7),
              ),
              Text(
                'Please enter book name or category to search',
                style: Styles.textStyle20.copyWith(
                  fontSize: 23,
                  color: Colors.white.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
