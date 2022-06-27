import 'package:apollo/models/company_account.dart';
import 'package:apollo/shared/utils/image_utils.dart';
import 'package:flutter/material.dart';

class CompanyAvatar extends StatelessWidget {
  final CompanyAccount company;
  final double size;
  const CompanyAvatar({Key? key, required this.company, this.size = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: company.imageURL != null
          ? ImageUtils(path: company.imageURL!, type: ImageType.Network)
              .make()
              .image
          : const ImageUtils(
                  path: 'assets/images/not_media.jpg', type: ImageType.Asset)
              .make()
              .image,
    );
  }
}
