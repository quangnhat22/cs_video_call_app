library forgot_password;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/common/widgets/stateless/buttons/float_back_button.dart';
import 'package:videocall/common/widgets/stateless/form/text_form_field.dart';
import 'package:videocall/core/config/app_assets.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/auth/forgot_password/cubit/send_email_cubit.dart';
import 'package:videocall/presentation/auth/login/login.dart';

part 'pages/reset_password_page.dart';
part 'widgets/send_email_form.dart';
part "pages/confirm_reset_code_page.dart";
part 'pages/new_password_page.dart';
part 'pages/reset_code_input.dart';
part 'pages/success_notification_page.dart';
