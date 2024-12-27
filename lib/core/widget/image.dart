import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class KImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;
  const KImage({super.key, required this.url, this.width = 100, this.height = 100, this.radius = 10});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}