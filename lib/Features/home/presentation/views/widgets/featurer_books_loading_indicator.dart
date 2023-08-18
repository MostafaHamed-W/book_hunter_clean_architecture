import 'package:book_hunt/core/widgets/fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedBooksLoadingIndicator extends StatelessWidget {
  const FeaturedBooksLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: AspectRatio(
                aspectRatio: 150 / 225,
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
      ),
    );
  }
}
