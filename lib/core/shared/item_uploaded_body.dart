import 'package:flutter/material.dart';

import 'package:phirus/core/shared/attatchment_upload.dart';

class ItemUploadedBody extends StatelessWidget {
  const ItemUploadedBody({
    super.key,
    required this.image,
    required this.title,
    required this.navigateToPage,
  });
  final String image;
  final String title;
  final VoidCallback navigateToPage;
  @override
  Widget build(BuildContext context) {
    return ItemUpload(
        itemUploded: title,
        image: image,
        itemScan: 'Upload $title',
        onTap: navigateToPage);
  }
}
