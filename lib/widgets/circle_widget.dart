import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_mvvm_demo/constant/const.dart';

class CircleImage extends StatelessWidget {
  final String img;
  const CircleImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img,
      imageBuilder: (context, imageProvider) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 1),
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return const Icon(Icons.image_not_supported);
      },
    );
  }
}
