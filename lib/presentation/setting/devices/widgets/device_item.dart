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
    return InkWell(
      child: ListTile(
        title: Text(deviceEntity.name ?? ''),
        subtitle: Text(
            '${AppLocalizations.of(context)!.last_accessed_at} ${DateFormat('dd-MM-yyyy').format(DateTime.parse(deviceEntity.createdAt!))}'),
        leading: const Icon(Icons.smartphone),
        // trailing: IconButton(
        //     onPressed: () {
        //       _handleDeleteDevice(context, deviceEntity.id, deviceEntity.name!);
        //     },
        //     icon: const Icon(
        //       Icons.delete,
        //       color: Colors.redAccent,
        //     )),
      ),
    );
  }
}
