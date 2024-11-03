import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImageWidget extends StatelessWidget {
  final String imageUrl;

  const AppImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}