library login;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:videocall/common/widgets/stateless/auth_header.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_text_button.dart';
import 'package:videocall/common/widgets/stateless/form/text_form_field.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/auth/login/cubit/login_cubit.dart';

import '../../../core/di/injector.dart';
import '../../../core/routes/route_name.dart';
import '../../../core/utils/screen_utils.dart';

part 'pages/login_page.dart';
part 'widgets/login_form.dart';
part 'widgets/login_input_email.dart';
part 'widgets/login_input_password.dart';
part 'widgets/login_button.dart';
