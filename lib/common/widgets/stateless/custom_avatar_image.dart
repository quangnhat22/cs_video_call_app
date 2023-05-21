import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_assets.dart';

class CustomAvatarImage extends StatelessWidget {
  const CustomAvatarImage({
    Key? key,
    this.urlImage,
    this.maxRadiusEmptyImg,
    this.widthImage,
    this.heightImage,
  }) : super(key: key);

  final String? urlImage;
  final double? maxRadiusEmptyImg;
  final double? widthImage;
  final double? heightImage;

  @override
  Widget build(BuildContext context) {
    // if url null -> show default avatar
    if (urlImage == null || urlImage == "") {
      return CircleAvatar(
        backgroundImage: AppAssets.emptyAvatar,
        maxRadius: maxRadiusEmptyImg ?? 24,
      );
    }

    return CachedNetworkImage(
      width: widthImage,
      height: heightImage,
      fit: BoxFit.cover,
      imageUrl: urlImage!,
      imageBuilder: (_, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
      ),
      //placeholder: (context, url) => const Skeleton.circle(),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
    );
  }
}
