library friends_contact;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';

import '../../../common/widgets/stateless/custom_avatar_image.dart';
import '../../../common/widgets/stateless/divider/divider_space_left.dart';
import '../../../core/di/injector.dart';
import 'bloc/friends_contact_bloc.dart';

part 'pages/friends_contact_page.dart';
part 'widgets/list_friend.dart';
part 'widgets/list_friend_item.dart';
