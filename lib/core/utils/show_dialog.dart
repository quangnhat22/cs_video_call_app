import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/core/config/app_text_styles.dart';

class AppDialog {
  const AppDialog._();

  static void showConfirmDialog(
    BuildContext context,
    String title,
    String content,
    VoidCallback handleCancelBtn,
    VoidCallback handleConfirmBtn,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          elevation: 48,
          actionsAlignment: MainAxisAlignment.spaceAround,
          //actionsOverflowButtonSpacing: 16.sw,
          actionsPadding: const EdgeInsets.all(4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          contentPadding: const EdgeInsets.all(16),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: AppTextStyles.headLineSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 1,
              )
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  content,
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
          actionsOverflowAlignment: OverflowBarAlignment.end,
          actions: [
            ActionDialogButton(
              title: AppLocalizations.of(context)!.cancel,
              onTab: handleCancelBtn,
            ),
            ActionDialogButton(
              title: AppLocalizations.of(context)!.confirm,
              onTab: handleConfirmBtn,
              isConfirm: true,
            ),
          ],
        );
      },
    );
  }
}

class ActionDialogButton extends StatelessWidget {
  const ActionDialogButton({
    super.key,
    required this.title,
    this.onTab,
    this.isConfirm = false,
  });

  final String title;
  final VoidCallback? onTab;
  final bool? isConfirm;

  @override
  Widget build(BuildContext context) {
    return isConfirm == true
        ? CustomElevatedButton(
            buttonText: title,
            onPressed: onTab,
          )
        : TextButton(
            onPressed: onTab,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: AppTextStyles.labelLarge),
            ),
          );
  }
}
