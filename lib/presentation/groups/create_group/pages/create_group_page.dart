part of create_group;

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final List<String> allFriends = [
    'Trần Đình Khôi',
    'Trần Đình Lộc',
    'Nguyễn Đình Nhật Quang',
    'Võ Minh Nhật',
    'Hoàng Thu Thủy',
    'Lý Nhân Nghĩa',
    'Đỗ Trí Nhân',
  ];

  final List<String> selectedFriends = [];
  late List<String> friendResults;

  File? imageFile;

  @override
  void initState() {
    super.initState();
    friendResults = [...allFriends];
  }

  void handleSelectMembers(String member) {
    if (!selectedFriends.contains(member)) {
      setState(() {
        selectedFriends.add(member);
      });
    } else {
      setState(() {
        selectedFriends.remove(member);
      });
    }
  }

  Widget buildFriendList(List<String> friends) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CheckboxListTile(
            title: Text(friends[index]),
            subtitle: Text(
              AppLocalizations.of(context)!.user_status_online,
              style: const TextStyle(color: Colors.green),
            ),
            secondary: const CircleAvatar(child: Text('A')),
            value: selectedFriends.contains(friends[index]),
            onChanged: (bool? value) => handleSelectMembers(friends[index]));
      },
      itemCount: friends.length,
    );
  }

  void handleTextChange(String value) {
    if (value == '') {
      setState(() {
        friendResults = [...allFriends];
      });
    } else {
      setState(() {
        friendResults = allFriends
            .where(
                (friend) => friend.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile!.path);
  }

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile!.path);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedFile = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
    if (croppedFile != null) {
      setState(() {
        imageFile = File(croppedFile.path);
      });
    }
  }

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
                AppLocalizations.of(context)!.choose_image_source_dialog_title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _getFromCamera();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(6),
                          child: Icon(Icons.camera_alt),
                        ),
                        Text(
                          AppLocalizations.of(context)!.camera_source_option,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _getFromGallery();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(6),
                          child: Icon(Icons.image),
                        ),
                        Text(
                          AppLocalizations.of(context)!.gallery_source_option,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.create_group_app_bar_title),
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            imageFile != null ? FileImage(imageFile!) : null,
                        child: imageFile != null
                            ? null
                            : IconButton(
                                onPressed: () {
                                  _showImageDialog();
                                },
                                icon: const Icon(
                                  Icons.camera_alt_rounded,
                                  size: 35,
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            _showImageDialog();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.set_new_photo,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      label: Text(AppLocalizations.of(context)!.group_name)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  AppLocalizations.of(context)!.add_members,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mediumTitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onInverseSurface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      hintText: AppLocalizations.of(context)!.search_friends),
                  onChanged: (value) {
                    handleTextChange(value);
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text(
                  '${selectedFriends.length} ${AppLocalizations.of(context)!.selected_text}',
                  textAlign: TextAlign.start,
                  style: AppTextStyles.mediumTitleTextStyle,
                ),
              ),
              buildFriendList(friendResults)
            ]),
      ),
    );
  }
}
