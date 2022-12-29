import 'package:alumnews/screens/tracer_study_form_alamat_screen.dart';
import 'package:alumnews/utils/colors.dart';
import 'package:flutter/material.dart';

enum GenderChoice { lakilaki, perempuan }

enum MaritalStatusChoice { menikah, belum, janda }

class TracerStudyFormScreen extends StatefulWidget {
  const TracerStudyFormScreen({Key? key}) : super(key: key);

  @override
  State<TracerStudyFormScreen> createState() => _TracerStudyFormScreenState();
}

class _TracerStudyFormScreenState extends State<TracerStudyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late GenderChoice _gender = GenderChoice.lakilaki;
  late MaritalStatusChoice _maritalStatus = MaritalStatusChoice.menikah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Tracer Study'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // nama
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan nama anda';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              // umur
              TextFormField(
                decoration: const InputDecoration(labelText: 'Umur'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan umur anda';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              // gender
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 2),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Jenis Kelamin",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
              ListTile(
                title: const Text('Laki-laki'),
                leading: Radio<GenderChoice>(
                  value: GenderChoice.lakilaki,
                  groupValue: _gender,
                  onChanged: (GenderChoice? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Perempuan'),
                leading: Radio<GenderChoice>(
                  value: GenderChoice.perempuan,
                  groupValue: _gender,
                  onChanged: (GenderChoice? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
              ),
              // status pernikahan
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 2),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Status Pernikahan",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
              ListTile(
                title: const Text('Menikah'),
                leading: Radio<MaritalStatusChoice>(
                  value: MaritalStatusChoice.menikah,
                  groupValue: _maritalStatus,
                  onChanged: (MaritalStatusChoice? value) {
                    setState(() {
                      _maritalStatus = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Belum Menikah'),
                leading: Radio<MaritalStatusChoice>(
                  value: MaritalStatusChoice.belum,
                  groupValue: _maritalStatus,
                  onChanged: (MaritalStatusChoice? value) {
                    setState(() {
                      _maritalStatus = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Janda/Duda'),
                leading: Radio<MaritalStatusChoice>(
                  value: MaritalStatusChoice.janda,
                  groupValue: _maritalStatus,
                  onChanged: (MaritalStatusChoice? value) {
                    setState(() {
                      _maritalStatus = value!;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    var route = MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const TracerStudyFormAlamatScreen(),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
