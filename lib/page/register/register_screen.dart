import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_starter_private/model/login_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_starter_private/components/form/dropdown_form_border.dart';
import 'package:flutter_starter_private/components/form/text_form_border.dart';
import 'package:flutter_starter_private/components/utils/icon_dark_circle.dart';
import 'package:flutter_starter_private/helper/utils.dart';
import 'package:flutter_starter_private/utils/storage_helper.dart';

import '../../components/button/button_primary.dart';
import '../../components/spacing.dart';
import '../../theme/appfont.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController fisrtNameField = TextEditingController();
  final TextEditingController lastNameField = TextEditingController();
  final TextEditingController dobField = TextEditingController();
  DateTime? dob;
  final TextEditingController passwordField = TextEditingController();
  final TextEditingController rePasswordField = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  Uint8List? profilPicture;

  GenderData? gender;

  UserData? currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  initData() async {
    try {
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExtraHeight(16),
            Text(currentUser != null ? 'Edit Profil' : 'Pendaftaran', style: AppFont.title22),
            const ExtraHeight(4),
            if (currentUser == null)
              const Text('Silahkan lengkapi data di bawah ini untuk menyelesaikan pedaftaran', style: AppFont.subtitle),
            const ExtraHeight(16),
            Center(
              child: InkWell(
                onTap: () async {
                  final data = await _picker.pickImage(source: ImageSource.gallery);
                  if (data != null) {
                    profilPicture = Uint8List.fromList(await data.readAsBytes());
                    setState(() {});
                  }
                },
                child: Stack(
                  children: [
                    const IconDarkCircle(icon: Icon(Icons.add_a_photo_rounded), size: 160),
                    if (profilPicture != null)
                      CircleAvatar(
                        foregroundImage: MemoryImage(profilPicture!),
                        radius: 80,
                      ),
                  ],
                ),
              ),
            ),
            const ExtraHeight(16),
            TextFormBorder(
              label: 'Nama Depan',
              hintText: 'Masukkan nama depan anda',
              controller: fisrtNameField,
              validator: Utils.formValidator('harus diisi'),
              onChanged: (value) => setState(() {}),
            ),
            const ExtraHeight(8),
            TextFormBorder(
              label: 'Nama Belakang',
              hintText: 'Masukkan nama belakang anda',
              controller: lastNameField,
              validator: Utils.formValidator('harus diisi'),
              onChanged: (value) => setState(() {}),
            ),
            const ExtraHeight(8),
            if (currentUser == null)
              TextFormBorder(
                label: 'Email',
                hintText: 'Masukkan email anda',
                controller: emailField,
                validator: Utils.formValidator('harus diisi'),
                onChanged: (value) => setState(() {}),
              ),
            const ExtraHeight(8),
            TextFormBorder(
              label: 'Tanggal Lahir',
              hintText: 'Masukkan Tanggal lahir anda',
              controller: dobField,
              readOnly: true,
              validator: Utils.formValidator('harus diisi'),
              onChanged: (value) => setState(() {}),
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                onPressed: () async {
                  final data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2000),
                  );
                  if (data != null) {
                    dobField.text = data.toIso8601String().split('T')[0];
                    setState(() {
                      dob = data;
                    });
                  }
                },
              ),
            ),
            const ExtraHeight(8),
            DropdownFormBorder<GenderData>(
              label: 'Gender',
              hintText: 'Masukkan Gender anda',
              onChange: (value) {
                setState(() {
                  gender = value;
                });
              },
              list: _listGender,
              value: gender,
              textSetter: (value) => value.dropdownText,
            ),
            const ExtraHeight(8),
            if (currentUser == null)
              TextFormBorder(
                label: 'Buat Kata Sandi',
                hintText: 'Silahkan buat kata sandi anda',
                obscureText: true,
                controller: passwordField,
                onChanged: (_) => setState(() {}),
                validator: (value) {
                  if (value!.length < 5) {
                    return 'minimal 5 karakter';
                  }
                  if (value != rePasswordField.text) {
                    return 'password harus sama';
                  }
                  return null;
                },
              ),
            const ExtraHeight(8),
            if (currentUser == null)
              TextFormBorder(
                label: 'Ulangi Kata Sandi',
                hintText: 'Silahkan ulangi kata sandi anda',
                obscureText: true,
                onChanged: (_) => setState(() {}),
                validator: (value) {
                  if (value != passwordField.text) {
                    return 'password harus sama';
                  }
                  return null;
                },
                controller: rePasswordField,
              ),
            const ExtraHeight(8),
            // CheckboxListTile(
            //   value: false,
            //   contentPadding: EdgeInsets.zero,
            //   controlAffinity: ListTileControlAffinity.leading,
            //   onChanged: (value) {},
            //   title: RichText(
            //       text: const TextSpan(
            //     style: AppFont.body,
            //     children: [
            //       TextSpan(text: 'Setuju dengan  berlaku '),
            //       TextSpan(text: 'syarat dan ketentuan', style: AppFont.primary),
            //       TextSpan(text: ' berlaku'),
            //     ],
            //   )),
            // ),
            const ExtraHeight(16),
            ButtonPrimary(
              text: currentUser != null ? 'Update' : 'Daftarkan',
              onPressed: () async {
              },
            ),
            const ExtraHeight(),
          ],
        ));
  }
}

class GenderData  {
  final String tipe;
  final String dropdownText;
  GenderData(this.dropdownText, this.tipe);
}

final _listGender = [
  GenderData('Laki-Laki', 'M'),
  GenderData('Perempuan', 'P'),
];
