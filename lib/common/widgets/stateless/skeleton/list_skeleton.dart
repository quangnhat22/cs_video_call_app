import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videocall/common/widgets/stateless/skeleton/skeleton.dart';

class ListSkeleton extends StatelessWidget {
  const ListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Skeleton.circle(
              width: 24.w,
              height: 24.h,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Skeleton.rectangular(
                height: 36.h,
                width: 200.w,
              ),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
