import 'package:flutter/material.dart';
import 'package:videocall/common/widgets/stateless/buttons/float_back_button.dart';
import 'package:videocall/core/config/app_color.dart';
import 'package:videocall/core/config/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color mainColor;

  const AuthHeader(this.title, this.subTitle, this.mainColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        left: 12,
        right: 12,
      ),
      decoration: BoxDecoration(color: mainColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FloatBackButton(Theme.of(context).colorScheme.onPrimary, mainColor),
        Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              title,
              style: AppTextStyles.displaySmall.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.lightColorScheme.background,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            subTitle,
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.lightColorScheme.background,
            ),
          ),
        )
      ]),
    );
  }
}
