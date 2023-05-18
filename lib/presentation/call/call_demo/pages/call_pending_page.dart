import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_assets.dart';

class CallPendingPage extends StatelessWidget {
  const CallPendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AppAssets.emptyAssetAvatar,
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Tran Dinh Khoi",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Incoming 00:01".toUpperCase(),
                    style: const TextStyle(color: Colors.white60),
                  ),
                  const Spacer(),
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.red,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: const Icon(
                                Icons.call_end,
                                size: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
