import 'package:flutter/material.dart';

import '../../../../core/config/app_assets.dart';

class PersonalCalling extends StatelessWidget {
  const PersonalCalling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AppAssets.emptyAvatar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Tran Dinh Khoi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Calling...",
                style: TextStyle(
                    color: Colors.white,
                    shadows: [BoxShadow(color: Colors.black, blurRadius: 3)],
                    fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}
