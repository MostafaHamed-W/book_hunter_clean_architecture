import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment = MainAxisAlignment.start, this.book});
  final MainAxisAlignment mainAxisAlignment;
  final BookEntity? book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star, color: Color(0xFFFFDD4F)),
        const SizedBox(width: 6),
        Text('${book!.rating!}', style: Styles.textStyle16),
        const SizedBox(width: 5),
        Text(
          '(${book!.readingCount})',
          style: Styles.textStyle14.copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      ],
    );
  }
}
