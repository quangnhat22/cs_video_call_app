library forgot_password;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:videocall/common/widgets/statefull/countdown_button.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:videocall/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/common/widgets/stateless/buttons/float_back_button.dart';

import 'package:videocall/common/widgets/stateless/form/text_form_field.dart';
import 'package:videocall/core/config/app_assets.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/snack_bar.dart';

import 'package:videocall/presentation/auth/forgot_password/cubit_forgot_password/forgot_password_cubit.dart';

part 'widgets/send_email_form.dart';
part 'pages/reset_password_page.dart';
