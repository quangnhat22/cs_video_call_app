library group_messages;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/empty_message/empty_message.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/domain/entities/meeting_pinned_message_entity.dart';
import 'package:videocall/presentation/groups/groups_details/group_messages/bloc/messages_bloc.dart';

part 'pages/group_messages_page.dart';
part 'widgets/pinned_message_list.dart';
part 'widgets/pinned_message_item.dart';
part 'widgets/meeting_pinned_message_list.dart';
