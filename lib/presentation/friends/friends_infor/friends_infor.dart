library friends_infor;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';
import 'package:videocall/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/list_tile/common_list_tile.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/common/widgets/stateless/skeleton/skeleton.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/presentation/others/refresh_view.dart';

import '../../../core/di/injector.dart';
import '../../../core/routes/app_navigation.dart';
import '../../../core/routes/route_name.dart';
import '../../../core/utils/date_time_format.dart';
import '../../../core/utils/snack_bar.dart';
import 'friend_action_cubit/friends_action_cubit.dart';
import 'friend_info_cubit/friend_info_cubit.dart';

part 'pages/friends_infor_page.dart';
part 'widgets/button_friend_block.dart';
part 'widgets/friend_actions.dart';
part 'widgets/friend_calls_history.dart';
part 'widgets/friend_details_infor.dart';
part 'widgets/friend_mutual_infor.dart';
