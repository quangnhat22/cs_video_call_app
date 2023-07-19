import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:videocall/common/widgets/stateless/skeleton/skeleton.dart';
import 'package:videocall/core/config/app_assets.dart';

import 'full_screen_image.dart';

enum CustomAvatarSize {
  small(46, 46),
  medium(64, 64),
  large(120, 120),
  extraLarge(240, 240);

  const CustomAvatarSize(this.width, this.height);

  final double width;
  final double height;
}

class CustomAvatarImage extends StatelessWidget {
  const CustomAvatarImage({
    Key? key,
    this.urlImage,
    this.maxRadiusEmptyImg = 24,
    this.size = CustomAvatarSize.small,
  }) : super(key: key);

  final String? urlImage;
  final double? maxRadiusEmptyImg;
  final CustomAvatarSize? size;

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
      width: size!.width,
      height: size!.height,
      fit: BoxFit.cover,
      imageUrl: urlImage!,
      imageBuilder: (_, imageProvider) => GestureDetector(
        onTap: () {
          if (urlImage != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FullScreenImage(imageUrl: urlImage!)));
          }
        },
        child: Container(
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
      ),
      //placeholder: (context, url) => const Skeleton.circle(),
      placeholder: (context, url) => const Skeleton.circle(),
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
    );
  }
}
