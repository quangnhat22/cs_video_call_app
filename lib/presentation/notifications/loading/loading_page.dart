import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videocall/core/config/app_assets.dart';
import 'package:videocall/core/config/app_text_styles.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: AppAssets.welcomeImage,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 32.h,
              ),
              child: Text(
                AppLocalizations.of(context)!.get_connect_with_your_friends,
                textAlign: TextAlign.center,
                style: AppTextStyles.headLineLarge
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                AppLocalizations.of(context)!
                    .easy_way_to_connect_and_call_video_with_your_friends,
                style: AppTextStyles.labelLarge.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            const SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(),
            ),
            SizedBox(
              height: 0.2.sh,
            ),
          ],
        ),
      )),
    );
  }
}
