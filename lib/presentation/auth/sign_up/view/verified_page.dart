import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_assets.dart';

class VerifiedPage extends StatelessWidget {
  const VerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(10)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(73, 57, 140, 1)),
                            shape: MaterialStateProperty.all(
                                const CircleBorder())),
                        child: const Icon(Icons.chevron_left),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 250, height: 250, child: AppAssets.logoImage),
                const Text(
                  'We have sent a verified email to you. Please check your email and click the link to verify your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 120, 117, 117)),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(73, 57, 140, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20))),
                      onPressed: () {},
                      child: const Text('SET UP MY PROFILE')),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(const BorderSide(
                              color: Color.fromRGBO(73, 57, 140, 1))),
                          foregroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(73, 57, 140, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20))),
                      child: const Text('I DON\'T GET IT')),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
