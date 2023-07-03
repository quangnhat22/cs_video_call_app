part of devices;

class DeviceItem extends StatelessWidget {
  const DeviceItem({required this.deviceEntity, super.key});

  final DeviceEntity deviceEntity;

  void _handleDeleteDevice(
      BuildContext ctx, String deviceId, String deviceName) {
    ctx
        .read<DevicesBloc>()
        .add(ConfirmDeleteDevice(deviceId: deviceId, deviceName: deviceName));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(deviceEntity.name ?? ''),
        subtitle: Text(
            '${AppLocalizations.of(context)!.last_accessed_at} ${DateFormat('dd-MM-yyyy').format(DateTime.parse(deviceEntity.createdAt!))}'),
        leading: const Icon(Icons.smartphone),
        trailing: IconButton(
            onPressed: () {
              _handleDeleteDevice(context, deviceEntity.id, deviceEntity.name!);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            )),
      ),
    );
  }
}
