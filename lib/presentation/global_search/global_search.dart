library global_search;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/presentation/global_search/bloc/global_search_bloc.dart';

part 'pages/global_search_page.dart';
part 'widgets/search_result.dart';
part 'widgets/friend_search_result.dart';
