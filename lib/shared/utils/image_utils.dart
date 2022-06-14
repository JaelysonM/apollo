import 'package:flutter/material.dart';

enum ImageType { Network, Asset }

class ImageUtils {
  final String path;
  final ImageType type;
  final double size;

  const ImageUtils(
      {required this.path, this.type = ImageType.Network, this.size = 15});

  Image make() {
    Image image;
    if (type == ImageType.Network) {
      image =
          Image.network(path, height: size, width: size, fit: BoxFit.contain);
    } else if (type == ImageType.Network) {
      image =
          Image.network(path, height: size, width: size, fit: BoxFit.contain);
    } else {
      image = Image.asset(path, height: size, width: size, fit: BoxFit.contain);
    }
    return image;
  }
}
