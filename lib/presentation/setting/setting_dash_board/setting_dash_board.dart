library setting_dash_board;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videocall/common/widgets/stateless/app_bar/m_app_bar.dart';
import 'package:videocall/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_outline_icon_button.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/show_dialog.dart';
import 'package:videocall/presentation/global_search/bloc/global_search_bloc.dart';
import 'package:videocall/presentation/setting/edit_language/edit_language.dart';
import 'package:videocall/presentation/setting/edit_theme/edit_theme.dart';

import '../../../common/widgets/stateless/divider/divider_space_left.dart';
import '../../../common/widgets/stateless/ink_well/inkwell_dynamic_border.dart';

import '../../../core/config/app_text_styles.dart';
import 'cubit/setting_cubit.dart';
part 'pages/setting_dash_board_page.dart';
part 'widgets/about_us_button.dart';
part 'widgets/device_settings.dart';
part 'widgets/logout_button.dart';
part 'widgets/profile_settings.dart';
part 'widgets/profile_info.dart';
