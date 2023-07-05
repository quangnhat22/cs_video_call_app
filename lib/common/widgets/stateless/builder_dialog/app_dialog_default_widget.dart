part of 'app_dialog_base_builder.dart';

class AppDefaultDialogWidget extends AppDialogBaseBuilder {
  @override
  AppDialogBaseBuilder setTitle(String? title) {
    _title = title;
    return super.setTitle(title);
  }

  @override
  AppDialogBaseBuilder setContent(String? content) {
    _content = content;
    return super.setContent(content);
  }

  @override
  AppDialogBaseBuilder setIcon(Widget? icon) {
    _icon = icon;
    return super.setIcon(icon);
  }

  @override
  AppDialogBaseBuilder setPositiveText(String? positiveText) {
    _positiveText = positiveText;
    return super.setPositiveText(positiveText);
  }

  @override
  AppDialogBaseBuilder setOnPositive(void Function()? onPositive) {
    _onPositive = onPositive;
    return super.setOnPositive(onPositive);
  }

  @override
  AppDialogBaseBuilder setNegativeText(String? negativeText) {
    _negativeText = negativeText;
    return super.setNegativeText(negativeText);
  }

  @override
  AppDialogBaseBuilder setOnNegative(void Function()? onNegative) {
    _onNegative = onNegative;
    return super.setOnNegative(onNegative);
  }

  @override
  AppDialogBaseBuilder setAppDialogType(AppDialogType? type) {
    _appDialogType = type;
    return super.setAppDialogType(type);
  }

  @override
  AppDialogBaseBuilder buildDialog(BuildContext context) {
    if (_appDialogType == AppDialogType.success) {
      setIcon(AppAssets.successIcon);
    }
    if (_appDialogType == AppDialogType.confirm) {
      setIcon(AppAssets.warningIcon);
    }
    if (_appDialogType == AppDialogType.error) {
      setIcon(AppAssets.errorIcon);
    }
    _dialog = Dialog(
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 8,
            ),
            if (_icon != null) _icon!,
            if (_title != null)
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: Text(
                    _title ?? "",
                    style: AppTextStyles.headlineTextStyle,
                  )),
            if (_content != null)
              Text(
                _content ?? "",
                textAlign: TextAlign.center,
                style: AppTextStyles.subTitleGreyText,
              ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_negativeText != null)
                  Expanded(
                      child: CustomTextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _onNegative?.call();
                    },
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    buttonText: _negativeText,
                  )),
                if (_negativeText != null) const SizedBox(width: 12),
                if (_positiveText != null)
                  Expanded(
                      child: CustomElevatedButton(
                    buttonText: _positiveText!,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      _onPositive?.call();
                    },
                  )),
              ],
            ),
          ],
        ),
      ),
    );
    return this;
  }
}
