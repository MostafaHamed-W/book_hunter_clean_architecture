import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'featured_books_sliver.dart';
import 'newest_books_sliver.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
        BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(pageNumber: nextPage++);
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
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: const [
        FeaturedBooksSliver(),
        NewestBooksSliver(),
      ],
    );
  }
}
