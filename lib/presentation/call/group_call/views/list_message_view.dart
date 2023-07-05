import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/presentation/call/group_call/cubit_call_group_status/call_group_status_cubit.dart';

class ListMessageView extends StatelessWidget {
  const ListMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CallGroupStatusCubit, CallGroupStatusState>(
        builder: (context, state) {
          return state.maybeWhen(
            connectedSuccess: (user, listMessage, room) {
              return Padding(
                padding:
                    EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 60.h),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        listMessage?[index].name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(listMessage?[index].message ?? ''),
                      leading: CustomAvatarImage(
                        urlImage: listMessage?[index].avatar,
                        widthImage: 48,
                        heightImage: 48,
                      ),
                      // isThreeLine: true,
                      trailing: Text(DateFormat.Hm().format(DateTime.now())),
                    );
                  },
                  itemCount: listMessage?.length ?? 0,
                ),
              );
            },
            orElse: () => const ListSkeleton(),
          );
        },
      ),
    );
  }
}
