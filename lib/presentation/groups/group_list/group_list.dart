library group_list;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/groups/group_list/bloc/group_list_bloc.dart';

import '../../../common/widgets/stateless/buttons/floating_action_stadium_button.dart';
import '../../../core/routes/app_navigation.dart';
import '../../../core/routes/route_name.dart';
import '../../others/refresh_view.dart';
import '../groups_details/bloc/group_detail_bloc.dart';

part 'pages/group_list_page.dart';
part 'widgets/dropdown_groups_filter_button.dart';
part 'widgets/group_list.dart';
part 'widgets/group_list_item.dart';
