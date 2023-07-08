library devices;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:videocall/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/domain/entities/device_entity.dart';
import 'package:videocall/presentation/setting/devices/bloc/devices_bloc.dart';

part 'pages/devices_page.dart';
part 'widgets/device_list.dart';
part 'widgets/device_item.dart';
