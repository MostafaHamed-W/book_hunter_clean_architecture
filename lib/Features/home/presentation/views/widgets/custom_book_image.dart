import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.aspectRatio = 150 / 225, required this.imgUrl});
  final double aspectRatio;
  final String imgUrl;
  final String errImage =
      'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg';
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imgUrl.isNotEmpty ? imgUrl : errImage,
          errorWidget: (context, url, error) => const Icon(
            Icons.image_not_supported,
            size: 50,
          ),
        ),
      ),
    );
  }
}
