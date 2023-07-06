library notifications_dash_board;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:videocall/common/widgets/stateless/app_bar/m_app_bar.dart';
import 'package:videocall/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/date_time_format.dart';
import 'package:videocall/domain/entities/notification_entity.dart';
import 'package:videocall/presentation/global_search/bloc/global_search_bloc.dart';
import 'package:videocall/presentation/notifications/notifications_dash_board/bloc/notification_bloc.dart';

part 'pages/notifications_dash_board_page.dart';
part 'widgets/notification_list.dart';
part 'widgets/notification_item.dart';
