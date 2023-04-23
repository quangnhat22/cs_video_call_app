library setting_dash_board;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_outline_icon_button.dart';
import 'package:videocall/common/widgets/stateless/m_app_bar.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/show_dialog.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';

import '../../../common/widgets/stateless/ink_well/inkwell_dynamic_border.dart';
import '../../../common/widgets/stateless/list_tile/setting_list_tile.dart';

part 'pages/setting_dash_board_page.dart';
part 'widgets/about_us_button.dart';
part 'widgets/device_settings.dart';
part 'widgets/logout_button.dart';
part 'widgets/profile_settings.dart';
part 'cubit/setting_cubit.dart';
part 'cubit/setting_state.dart';
part 'cubit/setting_dash_board.freezed.dart';
