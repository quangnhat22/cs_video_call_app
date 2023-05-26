library email_verify;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/stateless/buttons/custom_elevated_button.dart';
import '../../../common/widgets/stateless/custom_outlined_button.dart';
import '../../../core/config/app_assets.dart';
import '../../../core/di/injector.dart';
import '../../../core/utils/screen_utils.dart';
import '../../../core/utils/snack_bar.dart';
import 'cubit_send_email/send_email_cubit.dart';

part 'pages/verified_view.dart';
part 'widgets/button_email_received.dart';
part 'widgets/button_float_back_to_login.dart';
part 'widgets/text_notice_sent_email.dart';
