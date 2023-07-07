library group_requests;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:videocall/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/domain/entities/group_request_entity.dart';
import 'package:videocall/presentation/groups/group_requests/group_request_action_cubit/group_request_action_cubit.dart';
import 'package:videocall/presentation/groups/group_requests/list_group_request_bloc/list_group_request_bloc.dart';
import 'package:videocall/presentation/others/refresh_view.dart';

part 'pages/group_requests_page.dart';
part 'widgets/group_received_request_list.dart';
part 'widgets/group_requests_segmented_button.dart';
part 'widgets/group_sent_request_list.dart';
