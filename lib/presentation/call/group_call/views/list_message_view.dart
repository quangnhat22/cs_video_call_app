import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/core/utils/screen_utils.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/call/group_call/cubit_call_group_status/call_group_status_cubit.dart';
import 'package:videocall/presentation/call/group_call/views/group_call_message_item.dart';

import '../bloc/group_call_pin_message_bloc.dart';

class ListMessageView extends StatelessWidget {
  ListMessageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupCallPinMessageBloc, GroupCallPinMessageState>(
      listener: (context, state) {
        if (state is GroupCallPinMessageSuccess) {
          SnackBarApp.showSnackBar(
              context, 'Pin message successfully', TypesSnackBar.success);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => AppScreenUtils.hideInputKeyboard(),
              child: Stack(children: [
                BlocBuilder<CallGroupStatusCubit, CallGroupStatusState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      connectedSuccess: (user, listMessage, room) {
                        if (listMessage == null || listMessage.isEmpty) {
                          return Center(
                            child: Text(AppLocalizations.of(context)!
                                .no_messages_found),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 48.h,
                            bottom: 60.h,
                          ),
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                            itemBuilder: (context, index) {
                              return GroupCallMessageItem(
                                messageCallEntity: listMessage[index],
                                messageChild: ListTile(
                                  title: Text(
                                    listMessage[index].name ??
                                        AppLocalizations.of(context)!
                                            .unknown_name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle:
                                      Text(listMessage[index].message ?? ''),
                                  leading: CustomAvatarImage(
                                    urlImage: listMessage[index].avatar,
                                    size: CustomAvatarSize.small,
                                  ),
                                  // isThreeLine: true,
                                  trailing: Text(
                                      DateFormat.Hm().format(DateTime.now())),
                                ),
                              );
                            },
                            itemCount: listMessage.length,
                          ),
                        );
                      },
                      orElse: () => const ListSkeleton(),
                    );
                  },
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CallGroupStatusCubit>()
                                  .sendMessageData(_controller.text);
                            },
                            icon: const Icon(
                              Icons.send,
                              size: 26,
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  top: 0,
                  left: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        //   backgroundColor: MaterialStateProperty.all(backgroundColor),
                        shape: MaterialStateProperty.all(const CircleBorder())),
                    child: const Icon(
                      Icons.chevron_left,
                      //color: iconColor,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
