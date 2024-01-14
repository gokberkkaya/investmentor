import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';
import 'package:investmentor/services/user_data.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  double marginOfHigh = 20.0;
  late UserData _userData = UserData(
    name: '', jobTitle: '', birthday: '', gender: '', email: '', phoneNumber: ''
  );
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      UserData? userData = await UserData.getUserData(user!.uid);

      if (userData != null) {
        setState(() {
          _userData = userData;

          _nameController.text = _userData.name;
          _jobTitleController.text = _userData.jobTitle ?? '';
          _birthdayController.text = _userData.birthday ?? '';
          _genderController.text = _userData.gender ?? '';
          _emailController.text = _userData.email ?? '';
          _phoneNumberController.text = _userData.phoneNumber ?? '';
        });
      } else {
        setState(() {
          _userData = UserData(
            name: '', jobTitle: '', birthday: '', gender: '', email: '', phoneNumber: ''
          );
        });
      }
    } catch (e) {
      print("Hata: $e");

      setState(() {
        _userData = UserData(
          name: '', jobTitle: '', birthday: '', gender: '', email: '', phoneNumber: ''
        );
      });
    }
  }

  Future<void> _updateUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String userId = user!.uid;

      // Firestore referansını al
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Belgeyi al, varsa güncelle, yoksa oluştur
      DocumentSnapshot documentSnapshot = await users.doc(userId).get();

      if (documentSnapshot.exists) {
        // Belge zaten varsa güncelle
        await users.doc(userId).update({
          'name': _nameController.text,
          'email': _emailController.text,
          'jobTitle': _jobTitleController.text,
          'birthday': _birthdayController.text,
          'gender': _genderController.text,
          'phoneNumber': _phoneNumberController.text,
        });
      } else {
        // Belge yoksa oluştur
        await users.doc(userId).set({
          'jobTitle': _jobTitleController.text,
          'birthday': _birthdayController.text,
          'gender': _genderController.text,
          'phoneNumber': _phoneNumberController.text,
        });
      }
    } catch (e) {
      print("Firestore Hata: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  alignment: Alignment.topLeft,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('contact_title'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: marginOfHigh,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context)!.translate('contact_username'),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(51, 51, 51, 1)),
              ),
            ),
            SizedBox(
              height: marginOfHigh,
            ),
            TextFormField(
              controller: _jobTitleController,
              decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context)!.translate('contact_job'),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(51, 51, 51, 1)),
              ),
            ),
            SizedBox(
              height: marginOfHigh,
            ),
            TextFormField(
              controller: _birthdayController,
              decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context)!.translate('contact_birthday'),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(51, 51, 51, 1)),
              ),
            ),
            SizedBox(
              height: marginOfHigh,
            ),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context)!.translate('contact_gender'),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(51, 51, 51, 1)),
              ),
            ),
            SizedBox(
              height: marginOfHigh,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context)!.translate('contact_email'),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(51, 51, 51, 1)),
              ),
            ),
            SizedBox(
              height: marginOfHigh,
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                  .translate('contact_phone_number'),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(51, 51, 51, 1)),
              ),
            ),
            SizedBox(
              height: marginOfHigh * 2,
            ),
            ElevatedButton(
              onPressed: () async {
                await _updateUserData();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                backgroundColor: const Color.fromARGB(1000, 0, 198, 121),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Oval hale getir
                ), // Yeşil renk
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('contact_update_button'),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
