library edit_profile;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/common/widgets/stateless/form/text_form_field.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/screen_utils.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/setting/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/core/utils/date_time_format.dart';

part 'pages/edit_profile_page.dart';
part 'widgets/birthday_input.dart';
part 'widgets/edit_profile_form.dart';
part 'widgets/gender_input.dart';
part 'widgets/full_name_input.dart';
part 'widgets/phone_number_input.dart';
part 'widgets/bio_input.dart';
part 'widgets/confirm_button.dart';
