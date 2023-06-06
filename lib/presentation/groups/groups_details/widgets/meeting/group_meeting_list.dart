import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart';

class GroupMeetingList extends StatelessWidget {
  const GroupMeetingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailBloc, GroupDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const ListSkeleton();
          },
          getDetailSuccess: (groupDetail) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ListTile(
                          title: const Text('Trần Đình Khôi'),
                          subtitle: Wrap(
                            spacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_outward,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              const Text('(2) September 9 at 12:03 PM')
                            ],
                          ),
                          leading: const CircleAvatar(
                            child: Text('K'),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.call,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            onPressed: () {},
                          ));
                    },
                    semanticIndexCallback: (Widget widget, int localIndex) {
                      if (localIndex.isEven) {
                        return localIndex ~/ 2;
                      }
                      return null;
                    },
                    childCount: 0,
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
