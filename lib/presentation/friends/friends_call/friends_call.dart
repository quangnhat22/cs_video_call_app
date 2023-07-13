library friends_call;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/domain/entities/call_entity.dart';
import 'package:videocall/presentation/others/refresh_view.dart';

import '../../../common/widgets/stateless/divider/divider_space_left.dart';
import '../../../core/routes/app_navigation.dart';
import 'bloc/history_call_bloc.dart';

part 'pages/friends_call_page.dart';
part 'widgets/dropdown_filter_button.dart';
part 'widgets/friend_call_sliver_list.dart';
part 'widgets/list_friend_call.dart';
