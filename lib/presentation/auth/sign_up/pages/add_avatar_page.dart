import 'package:flutter/material.dart';
import 'package:videocall/common/widgets/stateless/auth_header.dart';
import 'package:videocall/common/widgets/stateless/custom_elevated_button.dart';
import 'package:videocall/common/widgets/stateless/custom_outlined_button.dart';
import 'package:videocall/core/config/app_assets.dart';

class AddAvatarPage extends StatelessWidget {
  const AddAvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const AuthHeader(
              'Add a photo',
              'Add a profile photo so your friends know it’s you!',
              Color.fromRGBO(123, 106, 193, 1)),
          Positioned(
            left: 0,
            right: 0,
            // top: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height *
                (MediaQuery.of(context).orientation == Orientation.landscape
                    ? 1
                    : 0.7),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height *
                  (MediaQuery.of(context).orientation == Orientation.landscape
                      ? 1
                      : 0.7),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                margin: const EdgeInsets.only(top: 1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: AppAssets.defaultAvatar,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: CustomElevatedButton('Choose a photo', () {},
                            const Color.fromRGBO(123, 106, 193, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: CustomOutlinedButton('Maybe later', () {},
                            const Color.fromRGBO(73, 57, 140, 1)),
                      )
                    ]),
              ),
            ),
          )
        ],
      )),
    );
  }
}
