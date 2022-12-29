import 'package:alumnews/screens/tracer_study_form_pendidikan.dart';
import 'package:alumnews/utils/colors.dart';
import 'package:flutter/material.dart';

class TracerStudyFormAlamatScreen extends StatefulWidget {
  const TracerStudyFormAlamatScreen({Key? key}) : super(key: key);

  @override
  State<TracerStudyFormAlamatScreen> createState() =>
      _TracerStudyFormAlamatScreenState();
}

class _TracerStudyFormAlamatScreenState
    extends State<TracerStudyFormAlamatScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _alamatRumah;
  late String _kotaRumah;
  late String _telpRumah;
  late String _hpRumah;
  late String _emailRumah;

  late String _alamatPekerjaan;
  late String _kotaPekerjaan;
  late String _telpPekerjaan;

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
              // alamat rumah
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 4),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Rumah",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan alamat rumah anda';
                  }
                  return null;
                },
                onSaved: (value) => _alamatRumah = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kota'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan kota rumah anda';
                  }
                  return null;
                },
                onSaved: (value) => _kotaRumah = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan nomor telepon rumah anda';
                  }
                  return null;
                },
                onSaved: (value) => _telpRumah = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nomor HP'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan Nomor HP anda';
                  }
                  return null;
                },
                onSaved: (value) => _hpRumah = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan email anda';
                  }
                  return null;
                },
                onSaved: (value) => _emailRumah = value!,
              ),
              // alamat pekerjaan
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 4),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Pekerjaan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan alamat pekerjaan anda';
                  }
                  return null;
                },
                onSaved: (value) => _alamatPekerjaan = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kota'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan kota pekerjaan anda';
                  }
                  return null;
                },
                onSaved: (value) => _kotaPekerjaan = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan nomor telepon pekerjaan anda';
                  }
                  return null;
                },
                onSaved: (value) => _telpPekerjaan = value!,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    var route = MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const TracerStudyFormPendidikanScreen(),
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
