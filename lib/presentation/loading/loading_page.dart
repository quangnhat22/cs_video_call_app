import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_assets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AppAssets.loadingGif,
      ),
    );
  }
}
