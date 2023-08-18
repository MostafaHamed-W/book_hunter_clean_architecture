import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimilarBooksListLoadingShimmer extends StatelessWidget {
  const SimilarBooksListLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white.withOpacity(0.6),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: AspectRatio(
              aspectRatio: 70 / 112,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
