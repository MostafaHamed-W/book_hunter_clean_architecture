import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.aspectRatio = 150 / 225, required this.imgUrl});
  final double aspectRatio;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imgUrl,
          errorWidget: (context, url, error) => const Center(child: Text('No image')),
        ),
      ),
    );
  }
}
