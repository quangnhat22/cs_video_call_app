import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_assets.dart';

class PersonalRinging extends StatelessWidget {
  const PersonalRinging({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
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
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.phone, color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Accept",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: Colors.redAccent, shape: BoxShape.circle),
                  child: const Icon(Icons.phone_outlined, color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Decline",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          "Decline & Send Message",
          style: TextStyle(color: Colors.white60, fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              width: 0.75.sw,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "I'll call you back",
                      style: TextStyle(color: Colors.white54),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sorry, I can't talk right now",
                      style: TextStyle(color: Colors.white54),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
