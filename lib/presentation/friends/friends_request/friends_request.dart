library friends_request;


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/widgets/stateless/custom_avatar_image.dart';
import '../../../core/di/injector.dart';
import '../../../core/utils/date_time_format.dart';
import '../../../core/utils/snack_bar.dart';
import '../../../domain/entities/friend_request_entity.dart';
import 'friend_request_action_cubit/friend_request_action_cubit.dart';
import 'list_friend_request_bloc/list_friend_request_bloc.dart';

part 'pages/friends_request_page.dart';
part 'widgets/list_request_friend_receive.dart';
part 'widgets/list_request_friend_send.dart';
part 'widgets/segment_button_friend_request.dart';part 'widgets/something_wrong.dart';