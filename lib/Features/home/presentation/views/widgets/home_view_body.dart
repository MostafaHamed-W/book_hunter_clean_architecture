import 'package:flutter/cupertino.dart';
import 'featured_books_sliver.dart';
import 'newest_books_sliver.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        FeaturedBooksSliver(),
        NewestBooksSliver(),
      ],
    );
  }
}
