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

  final _currencies = [
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

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);

      if (period == PeriodEnum.start) {
        setState(() {
          startTimeController.text = formattedTime;
        });
      } else {
        endTimeController.text = formattedTime;
      }
    }
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
                  SelectGroupButtonFormField(_currentSelectedValue,
                      (String? newValue) {
                    setState(() {
                      _currentSelectedValue = newValue!;
                    });
                  }, _currencies),
                  DescriptionTextFormField(descriptionController),
                  Row(
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child: TimePickerTextFormField(
                              startDateController,
                              handleShowDatePicker,
                              'Start date',
                              PeriodEnum.start)),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          flex: 1,
                          child: TimePickerTextFormField(
                              startTimeController,
                              handleShowTimePicker,
                              'Start time',
                              PeriodEnum.start)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child: TimePickerTextFormField(
                              endDateController,
                              handleShowDatePicker,
                              'End date',
                              PeriodEnum.end)),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          flex: 1,
                          child: TimePickerTextFormField(
                              endTimeController,
                              handleShowTimePicker,
                              'End time',
                              PeriodEnum.end)),
                    ],
                  ),
                  Card(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const DividerSpaceLeft(),
                      itemBuilder: (context, index) => ListTile(
                        title: const Text('Before 30 minutes'),
                        leading: Icon(
                          Icons.notifications_outlined,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        trailing: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      itemCount: 2,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
