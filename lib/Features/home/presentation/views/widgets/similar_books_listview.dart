import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:flutter/cupertino.dart';

import 'custom_book_image.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                imgUrl: '',
                aspectRatio: 70 / 112,
              ),
            );
          }),
    );
  }
}
