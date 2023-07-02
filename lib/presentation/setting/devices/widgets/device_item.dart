part of devices;

class DeviceItem extends StatelessWidget {
  const DeviceItem({required this.deviceEntity, super.key});

  final DeviceEntity deviceEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(deviceEntity.name ?? ''),
        subtitle: Text(
            'Last accessed at ${DateFormat('dd-MM-yyyy').format(DateTime.parse(deviceEntity.createdAt!))}'),
        leading: const Icon(Icons.smartphone),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            )),
      ),
    );
  }
}
