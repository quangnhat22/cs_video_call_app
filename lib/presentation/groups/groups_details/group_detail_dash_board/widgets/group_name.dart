part of group_details;

class GroupName extends StatelessWidget {
  const GroupName({
    super.key,
    this.initGroupName,
  });

  final String? initGroupName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailBloc, GroupDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          getDetailSuccess: (groupDetail) {
            return Text(
              groupDetail.groupDetails?.name ?? '',
              style: AppTextStyles.titleLarge,
            );
          },
          orElse: () {
            return Text(
              initGroupName ?? '',
              style: AppTextStyles.titleLarge,
            );
          },
        );
      },
    );
  }
}
