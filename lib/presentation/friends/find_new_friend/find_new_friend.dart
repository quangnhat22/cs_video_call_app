library find_new_friend;


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/core/routes/route_name.dart';

import '../../../common/widgets/stateless/app_bar/page_app_bar.dart';
import '../../../common/widgets/stateless/buttons/custom_elevated_button.dart';
import '../../../common/widgets/stateless/form/text_form_field.dart';
import '../../../core/config/app_assets.dart';
import '../../../core/di/injector.dart';
import '../../../core/routes/app_navigation.dart';
import '../../../core/utils/snack_bar.dart';
import 'bloc/find_friend_bloc.dart';
import 'cubit/find_friend_form_cubit.dart';

part 'pages/find_new_friend.dart';
part 'widgets/button_find_friend.dart';
part 'widgets/input_find_friend.dart';part 'widgets/not_found_result.dart';
