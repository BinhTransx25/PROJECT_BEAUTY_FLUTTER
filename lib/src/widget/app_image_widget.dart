import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImageWidget extends StatelessWidget {
  final String imageUrl;

  AppImageWidget({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
