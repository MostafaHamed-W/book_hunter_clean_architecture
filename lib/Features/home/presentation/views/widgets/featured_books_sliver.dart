import 'package:book_hunt/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/featured_book_cubit/featured_books_cubit.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view_bloc_builder.dart';

class FeaturedBooksSliver extends StatelessWidget {
  const FeaturedBooksSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListViewBlocBuilder(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text('Best Seller', style: Styles.textStyle18),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
