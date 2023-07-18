library global_search;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:videocall/core/config/app_assets.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/presentation/friends/friends_contact/friends_contact.dart';
import 'package:videocall/presentation/global_search/bloc/global_search_bloc.dart';
import 'package:videocall/presentation/groups/group_list/group_list.dart';

part 'pages/global_search_page.dart';
part 'widgets/friend_search_result.dart';
part 'widgets/group_search_result.dart';
part 'widgets/search_result.dart';
