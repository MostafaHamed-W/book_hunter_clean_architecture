import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:flutter/cupertino.dart';

import 'custom_book_image.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
          itemCount: books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: CustomBookImage(
                imgUrl: books[index].image!,
              ),
            );
          }),
    );
  }
}
