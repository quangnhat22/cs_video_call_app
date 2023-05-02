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
              AppLocalizations.of(context)!.choose_image_source_dialog_title,
              style: const TextStyle(fontSize: 20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWellDynamicBorder(
                  title: AppLocalizations.of(context)!.camera_source_option,
                  leading: const Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _getFromCamera();
                  },
                ),
                InkWellDynamicBorder(
                  title: AppLocalizations.of(context)!.gallery_source_option,
                  leading: const Icon(
                    Icons.image,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _getFromGallery();
                  },
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
            onPressed: () {
              debugPrint(selectedFriends.toString());
            },
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GroupSetPhoto(imageFile, _showImageDialog),
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
              GroupAddMembers(selectedFriends, friendResults,
                  handleSelectMembers, handleTextChange)
            ]),
      ),
    );
  }
}
