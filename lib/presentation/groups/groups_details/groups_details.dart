library groups_details;

import 'dart:convert';

import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/search/add_members_search.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/date_time_format.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/domain/entities/group_meeting_entity.dart';
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart';
import 'package:videocall/presentation/groups/groups_details/cubit_group_meeting/group_meeting_cubit.dart';
import 'package:videocall/presentation/groups/groups_details/cubit_inivite_new_member/new_member_cubit.dart';

import '../../../common/widgets/stateless/skeleton/list_skeleton.dart';

part 'pages/groups_details_page.dart';
part 'widgets/meeting/fab_create_new_meeting.dart';
part 'widgets/meeting/group_meeting_list.dart';
part 'widgets/meeting/group_meeting_list_item.dart';
part 'widgets/member/fab_invite_new_member.dart';
part 'widgets/member/group_member_item.dart';
part 'widgets/member/group_member_list.dart';
part 'widgets/member/group_member_number.dart';
part 'widgets/tabs/group_discuss_tab.dart';
part 'widgets/tabs/group_members_tab.dart';
part 'widgets/tabs/groups_calls_tab.dart';
