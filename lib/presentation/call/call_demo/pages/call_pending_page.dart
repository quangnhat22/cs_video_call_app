import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../common/widgets/statefull/count_up.dart';
import '../../../../core/config/app_assets.dart';

enum CallStatus { calling, accepted, ringing }

class CallPendingPage extends StatefulWidget {
  const CallPendingPage({Key? key, this.callStatus}) : super(key: key);

  final CallStatus? callStatus;

  @override
  State<CallPendingPage> createState() => _CallPendingPageState();
}

class _CallPendingPageState extends State<CallPendingPage> {
  late CallStatus callStatus;

  @override
  void initState() {
    callStatus = widget.callStatus ?? CallStatus.ringing;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> bottomSheetIcons = [
      Icons.speaker_outlined,
      Icons.bluetooth,
      Icons.videocam_outlined,
      Icons.mic_outlined,
      Icons.phone_outlined
    ];

    Widget _getBody() {
      switch (callStatus) {
        case CallStatus.calling:
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
                          )),
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
                          shadows: [
                            BoxShadow(color: Colors.black, blurRadius: 3)
                          ],
                          fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          );
        case CallStatus.accepted:
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
                      //avatar
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AppAssets.emptyAvatar, fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Nguyen Van A",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CountUp(
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          BoxShadow(color: Colors.black, blurRadius: 3)
                        ],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        case CallStatus.ringing:
          return Column(
            children: [
              const Spacer(),
              Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AppAssets.emptyAvatar, fit: BoxFit.cover)),
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
                        shadows: [
                          BoxShadow(color: Colors.black, blurRadius: 3)
                        ],
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
                        child: const Icon(Icons.phone_outlined,
                            color: Colors.white),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
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

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: 1.sw,
            height: 1.sh,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AppAssets.emptyAvatar,
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          _getBody(),
          SlidingUpPanel(
            panel: Container(
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    bottomSheetIcons.length,
                    (index) => Icon(
                          bottomSheetIcons[index],
                          color: index == 4 ? Colors.redAccent : Colors.white,
                        )),
              ),
            ),
            minHeight: 90,
            maxHeight: 200,
            collapsed: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    bottomSheetIcons.length,
                    (index) => Icon(
                          bottomSheetIcons[index],
                          color: index == 4 ? Colors.redAccent : Colors.white,
                        )),
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          )
        ],
      ),
    );
  }
}
