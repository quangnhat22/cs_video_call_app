import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({super.key, this.title, this.handleRefresh});

  final String? title;
  final VoidCallback? handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title ?? AppLocalizations.of(context)!.error_message),
        if (handleRefresh != null)
          IconButton(onPressed: handleRefresh, icon: const Icon(Icons.refresh))
      ],
    );
  }
}
