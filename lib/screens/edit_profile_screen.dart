import 'package:alumnews/resources/auth_methods.dart';
import 'package:alumnews/responsive/mobile_screen_layout.dart';
import 'package:alumnews/responsive/responsive_layout.dart';
import 'package:alumnews/responsive/web_screen_layout.dart';
import 'package:alumnews/screens/profile_screen.dart';
import 'package:alumnews/utils/colors.dart';
import 'package:alumnews/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alumnews/models/user.dart' as model;
import 'package:alumnews/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  User userdata = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _email;
  late String _name;
  late String? _bio;
  late String? _locationCountry;
  late String? _locationCity;
  late String? _phoneNumber;
  late String? _website;
  bool _isLoading = false;

  void editProfile() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // showSnackBar(context, _username);
    // signup user using our authmethodds
    showSnackBar(context, 'res');
    String res = await AuthMethods().editProfileUser(
      username: _username,
      email: _email,
      name: _name,
      bio: _bio,
      locationCountry: _locationCountry,
      locationCity: _locationCity,
      phoneNumber: _phoneNumber,
      website: _website,
    );
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });

      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    var countries = [
      "Indonesia",
      "Malaysia",
      "Australia",
      "Filipina",
      "Thailand"
    ];
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
                TextFormField(
                  maxLines: null,
                  decoration: const InputDecoration(labelText: 'Negara'),
                  onSaved: (value) => _locationCountry = value!,
                ),
                TextFormField(
                  maxLines: null,
                  decoration: const InputDecoration(labelText: 'Kota'),
                  onSaved: (value) => _locationCity = value!,
                ),
                // DropdownSearch<String>(
                //   popupProps: PopupProps.menu(
                //     showSelectedItems: true,
                //     disabledItemFn: (String s) => s.startsWith('I'),
                //   ),
                //   items: options,
                //   dropdownDecoratorProps: const DropDownDecoratorProps(
                //     dropdownSearchDecoration: InputDecoration(
                //       labelText: "Negara",
                //       hintText: "Pilih negara",
                //     ),
                //   ),
                //   onChanged: print,
                //   onSaved: (value) => _locationCountry = value!,
                // ),
                // DropdownSearch<String>(
                //   popupProps: PopupProps.menu(
                //     showSelectedItems: true,
                //     disabledItemFn: (String s) => s.startsWith('I'),
                //   ),
                //   items: options,
                //   dropdownDecoratorProps: const DropDownDecoratorProps(
                //     dropdownSearchDecoration: InputDecoration(
                //       labelText: "Kota",
                //       hintText: "Pilih Kota",
                //     ),
                //   ),
                //   onChanged: print,
                //   onSaved: (value) => _locationCity = value!,
                // ),
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
                  decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                  onSaved: (value) => _phoneNumber = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Website'),
                  onSaved: (value) => _phoneNumber = value!,
                ),
                // Container(
                //   child: Row(
                //     children: <Widget>[
                //       Expanded(
                //         flex: 60,
                //         child: TextFormField(
                //           obscureText: true,
                //           decoration:
                //               const InputDecoration(labelText: 'Nama Sekolah'),
                //           onSaved: (value) => _phoneNumber = value!,
                //         ),
                //       ),
                //       Expanded(
                //         flex: 20,
                //         child: TextFormField(
                //           obscureText: true,
                //           decoration:
                //               const InputDecoration(labelText: 'Jenjang'),
                //           onSaved: (value) => _phoneNumber = value!,
                //         ),
                //       ),
                //       Expanded(
                //         flex: 20,
                //         child: TextFormField(
                //           obscureText: true,
                //           decoration:
                //               const InputDecoration(labelText: 'Tahun Lulus'),
                //           onSaved: (value) => _phoneNumber = value!,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // showSnackBar(context, _username);
                      // Send login request
                      editProfile();
                    }
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
