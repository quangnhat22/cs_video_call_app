library notification_setting;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';
import 'package:videocall/common/widgets/stateless/skeleton/skeleton.dart';
import 'package:videocall/presentation/notifications/notification_setting/cubit_notification_setting/notification_setting_cubit.dart';
import 'package:videocall/presentation/others/refresh_view.dart';

import '../../../core/di/injector.dart';

part 'pages/notification_setting_page.dart';
part 'widgets/notification_switch.dart';
