library create_group;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/common/widgets/stateless/ink_well/inkwell_dynamic_border.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart';
import 'package:videocall/presentation/groups/create_group/cubit/create_group_cubit.dart';

import '../../../core/routes/app_navigation.dart';
import '../../../core/utils/snack_bar.dart';

part 'pages/create_group_page.dart';
part 'widgets/btn_add_new_group.dart';
part 'widgets/group_add_members.dart';
part 'widgets/group_set_photo.dart';
part 'widgets/group_text_field_name.dart';

//TODO: check this page again please
