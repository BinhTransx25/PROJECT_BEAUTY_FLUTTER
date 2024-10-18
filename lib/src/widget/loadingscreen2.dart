import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Loadingscreen2 extends StatelessWidget {
  const Loadingscreen2({super.key});
  final String imageUrl =
      'https://s1.zerochan.net/Typhon.%28Arknights%29.600.3975060.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Screen test 2'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
