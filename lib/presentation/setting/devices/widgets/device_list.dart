part of devices;

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesBloc, DevicesState>(
      listener: (context, state) {
        if (state is DevicesDeleteSuccess) {
          context.read<DevicesBloc>().add(const DevicesEvent.started());
        }
      },
      builder: (context, state) {
        return state.maybeWhen(
          failure: (message) {
            return Center(
              child: Text(AppLocalizations.of(context)!.error_message),
            );
          },
          success: (devices) {
            if (devices.isEmpty) {
              return Center(
                  child: Text(AppLocalizations.of(context)!.no_devices_found));
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 4.0,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DeviceItem(
                    deviceEntity: devices[index],
                  );
                },
                itemCount: devices.length,
              ),
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
