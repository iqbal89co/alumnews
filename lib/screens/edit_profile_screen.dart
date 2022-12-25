import 'package:alumnews/utils/colors.dart';
import 'package:alumnews/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alumnews/models/user.dart' as model;
import 'package:alumnews/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final String _username;
  late final String _email;
  late final String? _name;
  late final String? _bio;
  late final String? _locationCountry;
  late final String? _locationCity;
  late final String? _phoneNumber;
  late final String? _website;
  late final List? _educationExperiences;
  late final List? _workExperiences;
  @override
  Widget build(BuildContext context) {
    var options = ["Option 1", "Option 2", "Option 3"];
    final model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) => _username = value!,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value!,
                ),
                TextFormField(
                  maxLines: null,
                  decoration: const InputDecoration(labelText: 'Bio'),
                  onSaved: (value) => _bio = value!,
                ),
                Container(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 10, left: 4),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Lokasi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: options,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Negara",
                      hintText: "Pilih negara",
                    ),
                  ),
                  onChanged: print,
                  onSaved: (value) => _locationCountry = value!,
                ),
                DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: options,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Kota",
                      hintText: "Pilih Kota",
                    ),
                  ),
                  onChanged: print,
                  onSaved: (value) => _locationCity = value!,
                ),
                Container(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 20, left: 4),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Informasi Kontak",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                  onSaved: (value) => _phoneNumber = value!,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value!,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Website'),
                  onSaved: (value) => _phoneNumber = value!,
                ),
                Container(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 10, left: 4),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Pendidikan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Send login request
                    }
                    showSnackBar(context, _username);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
