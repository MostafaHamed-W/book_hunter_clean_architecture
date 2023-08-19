import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_hunt/Features/home/presentation/views/widgets/shimmers/similar_books_list_loading_shimmer.dart';
import 'package:book_hunt/core/utils/app_router.dart';
import 'package:book_hunt/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_book_image.dart';

class SimilarBooksListview extends StatelessWidget {
  final BookEntity book;
  const SimilarBooksListview({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSucess) {
            if (state.books.isEmpty) {
              return const Center(
                child: Text(
                  'Sorry there are no similar books!',
                  style: Styles.textStyle20,
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: state.books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kBookDetailsView, extra: state.books[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CustomBookImage(
                          imgUrl: state.books[index].image ?? '',
                          aspectRatio: 70 / 112,
                        ),
                      ),
                    );
                  });
            }
          } else if (state is SimilarBooksFailure) {
            return Text(state.errMessage);
          } else {
            return const SimilarBooksListLoadingShimmer();

            // const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
