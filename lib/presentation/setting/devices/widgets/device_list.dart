part of devices;

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesBloc, DevicesState>(
      builder: (context, state) {
        return state.maybeWhen(
          failure: (message) {
            return Center(
              child: Text(AppLocalizations.of(context)!.error_message),
            );
          },
          success: (devices) {
            if (devices.isEmpty) {
              return const Center(child: Text('No devices found'));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return DeviceItem(
                  deviceEntity: devices[index],
                );
              },
              itemCount: devices.length,
            );
          },
          orElse: () {
            return const ListSkeleton();
          },
        );
      },
    );
  }
}
