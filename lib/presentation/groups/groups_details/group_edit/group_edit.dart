library group_edit;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/group/group_set_photo.dart';
import 'package:videocall/common/widgets/stateless/group/group_text_field_name.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/utils/snack_bar.dart';

import 'cubit/edit_group_cubit.dart';

part 'pages/group_edit_page.dart';
part 'widgets/edit_group_button.dart';
