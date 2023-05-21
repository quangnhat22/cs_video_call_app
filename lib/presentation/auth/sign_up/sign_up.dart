library sign_up;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:videocall/common/widgets/stateless/auth_header.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_text_button.dart';
import 'package:videocall/common/widgets/stateless/custom_outlined_button.dart';
import 'package:videocall/common/widgets/stateless/form/password_text_field.dart';
import 'package:videocall/common/widgets/stateless/form/text_form_field.dart';
import 'package:videocall/core/config/app_assets.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/auth/avatar/avatar.dart';
import 'package:videocall/presentation/auth/sign_up/cubit_page_view/sign_up_page_view_cubit.dart';
import 'package:videocall/presentation/auth/sign_up/cubit_sign_up/sign_up_form_cubit.dart';

import '../../../core/utils/screen_utils.dart';
import '../profile/profile.dart';

part 'pages/sign_up_page.dart';
part 'pages/sign_up_main_view.dart';
part 'pages/register_account_view.dart';
part 'pages/verified_view.dart';
part 'widgets/sign_up/form_sign_up.dart';
part 'widgets/sign_up/input_email.dart';
part 'widgets/sign_up/input_password.dart';
part 'widgets/sign_up/input_confirm_password.dart';
part 'widgets/button_sign_up.dart';
part 'widgets/button_back_to_login.dart';
part 'widgets/button_float_back_to_login.dart';
part 'widgets/input_full_name.dart';
