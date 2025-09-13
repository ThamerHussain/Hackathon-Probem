import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? height;
  final double? width;
  const AppNetworkImage(
    this.url, {
    super.key,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      height: height,
      width: width,
      fadeInDuration: Duration.zero,
      placeholderFadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, error, stackTrace) {
        return Icon(Icons.error);
      },
    );
  }
}
