library change_password;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/common/widgets/stateless/form/text_form_field.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/utils/snack_bar.dart';

import 'cubit/change_password_cubit.dart';

part 'pages/change_password_page.dart';
part 'widgets/new_password_input.dart';
part 'widgets/confirm_new_password_input.dart';
part 'widgets/change_password_button.dart';
part 'widgets/old_password_input.dart';
