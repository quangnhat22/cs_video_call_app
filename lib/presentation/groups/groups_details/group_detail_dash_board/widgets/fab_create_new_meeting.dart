import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart';
import 'package:videocall/presentation/groups/groups_details/cubit_inivite_new_member/new_member_cubit.dart';

class FabCreateNewMeeting extends StatelessWidget {
  const FabCreateNewMeeting({super.key});

  void _createNewMeeting(BuildContext ctx) {
    final groupDetailState = ctx.read<GroupDetailBloc>().state;
    if (groupDetailState is GroupGetDetailSuccess &&
        groupDetailState.groupDetail.groupDetails?.id != null) {
      NavigationUtil.pushNamed(
              routeName: RouteName.createSchedule,
              args: groupDetailState.groupDetail.groupDetails!.id)
          .then((token) {
        if (token != null) {
          NavigationUtil.pushNamed(
              routeName: RouteName.createGroupCall, args: token);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewMemberCubit, NewMemberState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          getListFriendFail: (message) {
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.error);
          },
        );
      },
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () => _createNewMeeting(context),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          shape: const StadiumBorder(),
          child: (state is NewMemberGetListProgress)
              ? const CircularProgressIndicator()
              : Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ),
        );
      },
    );
  }
}
