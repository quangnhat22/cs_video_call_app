part of devices;

class DeviceItem extends StatelessWidget {
  const DeviceItem({required this.deviceEntity, super.key});

  final DeviceEntity deviceEntity;

  void _handleDeleteDevice(
      BuildContext ctx, String deviceId, String deviceName) {
    AppDefaultDialogWidget()
        .setAppDialogType(AppDialogType.confirm)
        .setTitle(AppLocalizations.of(ctx)!.confirm)
        .setContent(AppLocalizations.of(ctx)!.do_you_want_delete_device)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .setOnPositive(() {
          ctx.read<DevicesBloc>().add(
              ConfirmDeleteDevice(deviceId: deviceId, deviceName: deviceName));
          Navigator.of(ctx).pop();
        })
        .buildDialog(ctx)
        .show(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            deviceEntity.name ?? '',
            style: AppTextStyles.bodyLarge,
          ),
          subtitle: deviceEntity.isCurrentDevice
              ? Text(
                  AppLocalizations.of(context)!.currently_logged,
                  style: AppTextStyles.bodySmall
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                )
              : Text(
                  '${AppLocalizations.of(context)!.last_accessed_at} ${DateFormat('dd-MM-yyyy HH:mm').format(deviceEntity.createdAt!)}',
                  style: AppTextStyles.bodySmall,
                ),
          leading: const CircleAvatar(child: Icon(Icons.smartphone)),
          trailing: !deviceEntity.isCurrentDevice
              ? IconButton(
                  onPressed: () {
                    _handleDeleteDevice(
                        context, deviceEntity.id, deviceEntity.name!);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ))
              : null,
        ),
      ),
    );
  }
}
