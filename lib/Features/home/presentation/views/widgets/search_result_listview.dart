import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../../home/presentation/views/widgets/book_listview_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookListViewItem(book: books[index]);
        });
  }
}
