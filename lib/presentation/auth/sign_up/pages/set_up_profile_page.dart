import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:videocall/common/widgets/stateless/auth_header.dart';
import 'package:videocall/core/config/app_config.dart';
import 'package:videocall/presentation/auth/sign_up/pages/add_avatar_page.dart';

class SetUpProfilePage extends StatefulWidget {
  const SetUpProfilePage({super.key});

  @override
  State<SetUpProfilePage> createState() => _SetUpProfilePageState();
}

class _SetUpProfilePageState extends State<SetUpProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();
  String _selectedGender = 'male';

  void updateProfile() {
    if (_formKey.currentState!.validate()) {
      log(_fullNameController.text);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddAvatarPage()));
    }
  }

  String? validateEmptyField(String? value, String errorText) {
    if (value == null || value.isEmpty) {
      return errorText;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const AuthHeader(
                'Set up profile',
                'Give more information about you',
                Color.fromRGBO(123, 106, 193, 1)),
            Positioned(
              left: 0,
              right: 0,
              // top: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height *
                  (MediaQuery.of(context).orientation == Orientation.landscape
                      ? 1
                      : 0.7),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height *
                    (MediaQuery.of(context).orientation == Orientation.landscape
                        ? 1
                        : 0.7),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  margin: const EdgeInsets.only(top: 1),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: TextFormField(
                            controller: _fullNameController,
                            validator: (value) => validateEmptyField(
                                value, 'Please enter full name'),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.badge),
                              label: Text('Full Name (*)'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: TextFormField(
                            controller: _phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone number';
                              }

                              if (!value.isValidPhoneNumber()) {
                                return 'Phone number is invalid';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              label: Text('Phone (*)'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: TextFormField(
                            controller: _birthdayController,
                            validator: (value) => validateEmptyField(
                                value, 'Please choose birthday'),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.today),
                              label: Text('Birthday (*)'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                            onTap: () async {
                              DateTime? chosenDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime.now());

                              if (chosenDate != null) {
                                setState(() {
                                  _birthdayController.text =
                                      DateFormat('yyyy-MM-dd')
                                          .format(chosenDate);
                                });
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: DropdownButtonFormField(
                              items: const [
                                DropdownMenuItem(
                                    value: 'male', child: Text('Male')),
                                DropdownMenuItem(
                                    value: 'female', child: Text('Female')),
                              ],
                              value: _selectedGender,
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedGender = value;
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.today),
                                  label: Text('Gender (*)'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8))))),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: updateProfile,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(123, 106, 193, 1)),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 20)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)))),
                              child: const Text('UPDATE PROFILE'),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
