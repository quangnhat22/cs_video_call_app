library avatar;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/common/widgets/stateless/dialog/asset_dialog.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/assets_picker.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/auth/avatar/cubit_avatar/avatar_cubit.dart';

import '../../../common/widgets/stateless/auth_header.dart';
import '../../../common/widgets/stateless/buttons/custom_elevated_button.dart';
import '../../../core/config/app_assets.dart';

part "pages/avatar_page.dart";
part 'widgets/button_choose_avatar.dart';
part 'widgets/dialog_pick_avatar.dart';
