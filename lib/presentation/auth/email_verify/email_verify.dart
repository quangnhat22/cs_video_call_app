library email_verify;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videocall/common/widgets/statefull/countdown_button.dart';
import 'package:videocall/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_outline_icon_button.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_text_button.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/presentation/auth/email_verify/cubit_is_sent_email/is_sent_email_cubit.dart';

import '../../../common/widgets/stateless/buttons/custom_elevated_button.dart';
import '../../../common/widgets/stateless/custom_outlined_button.dart';
import '../../../core/config/app_assets.dart';
import '../../../core/config/app_text_styles.dart';
import '../../../core/di/injector.dart';
import '../../../core/utils/screen_utils.dart';
import '../../../core/utils/snack_bar.dart';
import 'cubit_send_email/send_email_cubit.dart';

part 'pages/verify_email_page.dart';
part 'widgets/button_email_received.dart';
part 'widgets/button_float_back_to_login.dart';
part 'widgets/button_logout.dart';
part 'widgets/button_resend_email.dart';
part 'widgets/column_button_action.dart';
part 'widgets/text_notice_sent_email.dart';
