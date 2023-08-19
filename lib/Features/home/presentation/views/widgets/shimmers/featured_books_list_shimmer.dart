import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedBooksListShimmer extends StatelessWidget {
  const FeaturedBooksListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(0.5),
        highlightColor: Colors.grey.withOpacity(0.5),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: AspectRatio(
                    aspectRatio: 150 / 225,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
