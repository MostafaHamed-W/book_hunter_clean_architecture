import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/Features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_hunt/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_image.dart';

class BooksListView extends StatefulWidget {
  const BooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<BooksListView> createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView> {
  int nextPage = 1;
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      scrollControllerListner();
    });
    super.initState();
  }

  void scrollControllerListner() {
    bool isLoading = false;
    var currentPosition = _scrollController.position.pixels;
    if (currentPosition > 0.7 * _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
      debugPrint('70% exceded');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: widget.books[index]);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: CustomBookImage(
                  imgUrl: widget.books[index].image!,
                ),
              ),
            );
          }),
    );
  }
}
