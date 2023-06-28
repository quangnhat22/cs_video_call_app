import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/core/config/app_text_styles.dart';

import '../../bloc/group_detail_bloc.dart';

class GroupMemberNumber extends StatelessWidget {
  const GroupMemberNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailBloc, GroupDetailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: state.maybeWhen(getDetailSuccess: (groupDetail) {
            return Text(
              '${groupDetail.members?.length ?? 0} ${AppLocalizations.of(context)!.members_text_title}',
              style: AppTextStyles.mediumTitleTextStyle,
            );
          }, orElse: () {
            return const Text(
              '0',
              style: AppTextStyles.mediumTitleTextStyle,
            );
          }),
        );
      },
    );
  }
}
