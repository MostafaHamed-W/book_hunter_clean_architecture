import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/assets.dart';

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
        ),
      ),
    );
  }
}


// Container(
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(17)),
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: NetworkImage(book!.image!),
//           ),
//         ),
//       ),