import 'package:alumnews/utils/colors.dart';
import 'package:flutter/material.dart';

enum EducationalLevelChoice { magister, doktoral }

class TracerStudyFormPendidikanScreen extends StatefulWidget {
  const TracerStudyFormPendidikanScreen({Key? key}) : super(key: key);

  @override
  State<TracerStudyFormPendidikanScreen> createState() =>
      _TracerStudyFormPendidikanScreenState();
}

class _TracerStudyFormPendidikanScreenState
    extends State<TracerStudyFormPendidikanScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _pendidikanBidang;
  late String _pendidikanTahunLulus;

  late String _tahunAngkatan;
  late EducationalLevelChoice _educationalLevel =
      EducationalLevelChoice.magister;

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
              // pendidikan lanjutan
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 4),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Pendidikan Lanjutan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              // bidang
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bidang'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan bidang pendidikan anda';
                  }
                  return null;
                },
                onSaved: (value) => _pendidikanBidang = value!,
              ),
              // strata
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 2),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Strata",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
              ListTile(
                title: const Text('Magister'),
                leading: Radio<EducationalLevelChoice>(
                  value: EducationalLevelChoice.magister,
                  groupValue: _educationalLevel,
                  onChanged: (EducationalLevelChoice? value) {
                    setState(() {
                      _educationalLevel = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Doktoral'),
                leading: Radio<EducationalLevelChoice>(
                  value: EducationalLevelChoice.doktoral,
                  groupValue: _educationalLevel,
                  onChanged: (EducationalLevelChoice? value) {
                    setState(() {
                      _educationalLevel = value!;
                    });
                  },
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tahun Lulus'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan tahun lulus pendidikan anda';
                  }
                  return null;
                },
                onSaved: (value) => _pendidikanTahunLulus = value!,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
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
