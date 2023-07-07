library friend_call;

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/common/widgets/stateless/buttons/float_action_button_video.dart';
import 'package:videocall/common/widgets/stateless/call/video_render/participant.dart';
import 'package:videocall/common/widgets/stateless/call/video_render/participant_info.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/utils/live_kit_until.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/call/friend_call/cubit/friend_call_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'pages/friend_call_page.dart';
part 'views/connected_call_view.dart';
part 'views/connecting_call_view.dart';
part 'views/prepare_call_view.dart';
part 'widgets/friend_call_controls.dart';
