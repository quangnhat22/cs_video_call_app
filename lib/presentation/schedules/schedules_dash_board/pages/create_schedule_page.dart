part of schedule_dash_board;

class CreateSchedulePage extends StatefulWidget {
  const CreateSchedulePage({super.key});

  @override
  State<CreateSchedulePage> createState() => _CreateSchedulePageState();
}

class _CreateSchedulePageState extends State<CreateSchedulePage> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final startDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endDateController = TextEditingController();
  final endTimeController = TextEditingController();

  @override
  void initState() {
    startDateController.text = DateFormat('MM-dd-yyyy').format(DateTime.now());
    startTimeController.text = DateFormat('hh:mm a')
        .format(DateTime.now().add(const Duration(minutes: 10)));
    endDateController.text = DateFormat('MM-dd-yyyy').format(DateTime.now());
    endTimeController.text = DateFormat('hh:mm a')
        .format(DateTime.now().add(const Duration(minutes: 15)));
    super.initState();
  }

  final groups = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  String? _currentSelectedValue;
  final durations = [
    '5',
    '30',
  ];
  final List<String> allMembers = [
    'Trần Văn Nhân',
    'Đỗ Tự Cường',
    'Lý Hoàng Oanh',
    'Trần Văn Thành'
  ];
  final List<String> selectedMembers = [];

  void handleShowDatePicker(PeriodEnum period) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);

      if (period == PeriodEnum.start) {
        setState(() {
          startDateController.text = formattedDate;
        });
      } else {
        setState(() {
          endDateController.text = formattedDate;
        });
      }
    }
  }

  void handleShowTimePicker(PeriodEnum period) async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    String formattedTime = "";

    if (pickedTime != null) {
      if (context.mounted) {
        formattedTime = pickedTime.format(context);
      }

      if (period == PeriodEnum.start) {
        setState(() {
          startTimeController.text = formattedTime;
        });
      } else {
        endTimeController.text = formattedTime;
      }
    }
  }

  void handleShowAddNotiDialog(BuildContext context) {
    final extraDurations = ['5', '30', '60', '90', '120'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.add_notifications),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: extraDurations
                  .map((e) => ListTile(
                        title: Text(
                            '${AppLocalizations.of(context)!.before} ${e.toString()} ${AppLocalizations.of(context)!.minutes}'),
                        onTap: () {
                          if (!durations.contains(e.toString())) {
                            setState(() {
                              durations.add(e.toString());
                            });
                          }
                        },
                      ))
                  .toList()),
        );
      },
    );
  }

  void handleRemoveNotifications(int index) {
    setState(() {
      durations.removeAt(index);
    });
  }

  void handleAddParticipants(List<dynamic> newMembers) {
    setState(() {
      List<String> decodedMembers = List<String>.from(newMembers);
      selectedMembers.addAll(decodedMembers);
    });
  }

  void handleRemoveParticipant(int index) {
    setState(() {
      selectedMembers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.create_schedule_app_bar_title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            NavigationUtil.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Wrap(
                runSpacing: 24,
                children: <Widget>[
                  TitleTextFormField(titleController),
                  // SelectGroupButtonFormField(_currentSelectedValue,
                  //     (String? newValue) {
                  //   setState(() {
                  //     _currentSelectedValue = newValue!;
                  //   });
                  // }, groups),
                  DescriptionTextFormField(descriptionController),
                  // Row(
                  //   children: <Widget>[
                  //     Flexible(
                  //         flex: 1,
                  //         child: TimePickerTextFormField(
                  //             startDateController,
                  //             handleShowDatePicker,
                  //             AppLocalizations.of(context)!
                  //                 .start_date_label_text_form_field,
                  //             PeriodEnum.start)),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Flexible(
                  //         flex: 1,
                  //         child: TimePickerTextFormField(
                  //             startTimeController,
                  //             handleShowTimePicker,
                  //             AppLocalizations.of(context)!
                  //                 .start_time_label_text_form_field,
                  //             PeriodEnum.start)),
                  //   ],
                  // ),
                  // Row(
                  //   children: <Widget>[
                  //     Flexible(
                  //         flex: 1,
                  //         child: TimePickerTextFormField(
                  //             endDateController,
                  //             handleShowDatePicker,
                  //             AppLocalizations.of(context)!
                  //                 .end_date_label_text_form_field,
                  //             PeriodEnum.end)),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Flexible(
                  //         flex: 1,
                  //         child: TimePickerTextFormField(
                  //             endTimeController,
                  //             handleShowTimePicker,
                  //             AppLocalizations.of(context)!
                  //                 .end_time_label_text_form_field,
                  //             PeriodEnum.end)),
                  //   ],
                  // ),
                  // ScheduleAddNotifications(durations, handleRemoveNotifications,
                  //     handleShowAddNotiDialog),
                  // ScheduleAddParticipants(allMembers, selectedMembers,
                  //     handleAddParticipants, handleRemoveParticipant)
                ],
              ),
            )),
      ),
    );
  }
}
