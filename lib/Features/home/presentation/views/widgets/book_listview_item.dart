import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/core/utils/app_router.dart';
import 'package:book_hunt/core/utils/assets.dart';
import 'package:book_hunt/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, this.book});

  final BookEntity? book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 25, bottom: 20),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kBookDetailsView);
        },
        child: SizedBox(
          height: 130,
          width: double.infinity,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 300 / 480,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: book!.image!,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        book!.title!,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: AssetsData.kGspectraFine,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 11),
                    Text(book!.authorName!,
                        style: Styles.textStyle14.copyWith(color: Colors.white.withOpacity(0.7))),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text('Free', style: Styles.textStyle20),
                        const Spacer(
                          flex: 8,
                        ),
                        BookRating(book: book!),
                        const Spacer(flex: 3)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
