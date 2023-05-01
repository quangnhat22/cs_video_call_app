library groups_details;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/search/add_members_search.dart';
import 'package:videocall/core/config/app_text_styles.dart';

import '../../../core/routes/app_navigation.dart';
import '../../../core/routes/route_name.dart';

part 'pages/groups_details_page.dart';

part 'widgets/tabs/groups_calls_tab.dart';
part 'widgets/tabs/group_discuss_tab.dart';
part 'widgets/tabs/group_members_tab.dart';
