part of schedule_dash_board;

class CreateSchedulePage extends StatefulWidget {
  CreateSchedulePage({super.key});

  @override
  State<CreateSchedulePage> createState() => _CreateSchedulePageState();
}

class _CreateSchedulePageState extends State<CreateSchedulePage> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: <Widget>[
                  TitleTextFormField(titleController),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                          hintText: 'Please select a group',
                          label: const Text('Select a group'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.onInverseSurface),
                      validator: (value) =>
                          value == null ? "Select a country" : null,
                      value: _currentSelectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentSelectedValue = newValue!;
                        });
                      },
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 150,
                    child: Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text('Description'),
                          hintText:
                              'Let participants know more about the meeting',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
