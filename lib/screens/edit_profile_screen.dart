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
    var country = [
      "Hong Kong",
      "Hungary",
      "Iceland",
      "India",
      "Indonesia",
      "Iran",
      "Iraq",
      "Ireland",
      "Isle of Man",
      "Israel",
      "Italy",
      "Jamaica",
      "Japan",
      "Jersey",
      "Jordan",
      "Kazakhstan",
      "Kenya",
      "Kuwait",
      "Kyrgyz Republic",
      "Laos",
      "Latvia",
      "Lebanon",
      "Lesotho",
      "Liberia",
      "Libya",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Macau",
      "Macedonia",
      "Madagascar",
      "Malawi",
      "Malaysia",
      "Maldives",
      "Mali",
      "Malta",
      "Mauritania",
      "Mauritius",
      "Mexico",
      "Moldova",
      "Monaco",
      "Mongolia",
      "Montenegro",
      "Montserrat",
      "Morocco",
      "Mozambique",
      "Namibia",
      "Nepal",
      "Netherlands",
      "Netherlands Antilles",
      "New Caledonia",
      "New Zealand",
      "Nicaragua",
      "Niger",
      "Nigeria",
      "Norway",
      "Oman",
      "Pakistan",
      "Palestine",
      "Panama",
      "Papua New Guinea",
      "Paraguay",
      "Peru",
      "Philippines",
      "Poland",
      "Portugal",
      "Puerto Rico",
      "Qatar",
      "Reunion",
      "Romania",
      "Russia",
      "Rwanda",
      "Saint Pierre &amp; Miquelon",
      "Samoa",
      "San Marino",
      "Satellite",
      "Saudi Arabia",
      "Senegal",
      "Serbia",
      "Seychelles",
      "Sierra Leone",
      "Singapore",
      "Slovakia",
      "Slovenia",
      "South Africa",
      "South Korea",
      "Spain",
      "Sri Lanka",
      "St Kitts &amp; Nevis",
      "St Lucia",
      "St Vincent",
      "St. Lucia",
      "Sudan",
      "Suriname",
      "Swaziland",
      "Sweden",
      "Switzerland",
      "Syria",
      "Taiwan",
      "Tajikistan",
      "Tanzania",
      "Thailand",
      "Timor L'Este",
      "Togo",
      "Tonga",
      "Trinidad &amp; Tobago",
      "Tunisia",
      "Turkey",
      "Turkmenistan",
      "Turks &amp; Caicos",
      "Uganda",
      "Ukraine",
      "United Arab Emirates",
      "United Kingdom",
      "Uruguay",
      "Uzbekistan",
      "Venezuela",
      "Vietnam",
      "Virgin Islands (US)",
      "Yemen",
      "Zambia",
      "Zimbabwe"
    ];
    var city = [
      "Banda Aceh",
      "Langsa",
      "Lhokseumawe",
      "Sabang",
      "Subulussalam",
      "Binjai",
      "Gunungsitoli",
      "Medan",
      "Padangsidempuan",
      "Pematangsiantar",
      "Sibolga",
      "Tanjungbalai",
      "Tebing Tinggi",
      "Bengkulu",
      "Jambi",
      "Sungaipenuh",
      "Dumai",
      "Pekanbaru",
      "Bukittinggi",
      "Padang",
      "Padang Panjang",
      "Pariaman",
      "Payakumbuh",
      "Sawahlunto",
      "Solok",
      "Lubuklinggau",
      "Pagar Alam",
      "Palembang",
      "Prabumulih",
      "Bandar Lampung",
      "Metro",
      "Pangkalpinang",
      "Batam",
      "Tanjungpinang",
      "Jawa",
      "Bandung",
      "Banjar",
      "Batu",
      "Bekasi",
      "Blitar",
      "Bogor",
      "Cilegon",
      "Cimahi",
      "Cirebon",
      "Depok",
      "Jakarta",
      "Jakarta Utara",
      "Jakarta Timur",
      "Jakarta Pusat",
      "Jakarta Selatan",
      "Jakarta Barat",
      "Kediri",
      "Madiun",
      "Magelang",
      "Malang",
      "Mojokerto",
      "Pasuruan",
      "Pekalongan",
      "Probolinggo",
      "Salatiga",
      "Semarang",
      "Serang",
      "Sukabumi",
      "Surabaya",
      "Surakarta",
      "Tasikmalaya",
      "Tangerang",
      "Tangerang Selatan",
      "Tegal",
      "Yogyakarta",
      "Kalimantan",
      "Pontianak",
      "Singkawang",
      "Banjarbaru",
      "Banjarmasin",
      "Palangka Raya",
      "Balikpapan",
      "Bontang",
      "Samarinda",
      "Tarakan",
      "Nusantara",
      "Nusa Tenggara",
      "Denpasar",
      "Bima",
      "Mataram",
      "Kupang",
      "Sulawesi",
      "Gorontalo",
      "Makassar",
      "Palopo",
      "Parepare",
      "Baubau",
      "Kendari",
      "Palu",
      "Bitung",
      "Kotamobagu",
      "Manado",
      "Tomohon",
      "Maluku",
      "Ambon",
      "Tual",
      "Ternate",
      "Tidore Kepulauan",
      "Papua",
      "Jayapura",
      "Sorong"
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
                DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: country,
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
                  items: city,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Kota",
                      hintText: "Pilih Kota",
                    ),
                  ),
                  onChanged: print,
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
