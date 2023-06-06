library profile;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/auth/profile/cubit_profile_form/profile_form_cubit.dart';

import '../../../common/widgets/stateless/auth_header.dart';
import '../../../common/widgets/stateless/form/text_form_field.dart';
import '../../../core/utils/date_time_format.dart';

part 'pages/profile_page.dart';
part 'widgets/button_set_up_profile.dart';
part 'widgets/form_set_up_profile.dart';
part 'widgets/input_birthday.dart';
part 'widgets/input_full_name.dart';
part 'widgets/input_gender.dart';
part 'widgets/input_phone.dart';
