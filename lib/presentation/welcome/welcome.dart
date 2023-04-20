library welcome;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_outline_icon_button.dart';
import 'package:videocall/common/widgets/stateless/divider/divider_with_text.dart';
import 'package:videocall/core/config/app_assets.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/domain/modules/auth/repositories/auth_repostiory.dart';

import '../../core/config/app_text_styles.dart';
import '../../core/routes/app_navigation.dart';
import '../../core/routes/route_name.dart';
import '../../core/utils/screen_utils.dart';
import '../app/bloc/app_bloc.dart';

part 'cubit/welcome_cubit.dart';
part 'cubit/welcome_state.dart';
part 'enum/login_with_google_state.dart';
part 'pages/welcome_page.dart';
part 'widgets/login_with_google_button.dart';
part 'widgets/sign_in_button.dart';
part 'widgets/welcom_actions.dart';
part 'widgets/welcome_panel.dart';
