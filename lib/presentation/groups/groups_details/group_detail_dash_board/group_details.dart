library group_details;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/groups/group_list/group_list.dart';
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart';
import 'package:videocall/presentation/groups/groups_details/cubit_inivite_new_member/new_member_cubit.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/pages/group_meeting_page.dart';
import 'package:videocall/presentation/groups/groups_details/group_member/pages/group_members_tab.dart';
import 'package:videocall/presentation/groups/groups_details/group_member/widget/fab_invite_new_member.dart';
import 'package:videocall/presentation/groups/groups_details/group_messages/group_messages.dart';

part 'pages/groups_details_page.dart';
part 'widgets/fab_create_new_meeting.dart';
part 'widgets/group_name.dart';
