import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rock_med/models/model_user.dart';
import 'package:rock_med/screens/screens.dart';
import 'package:rock_med/services/services.dart';
import 'package:rock_med/widget/constume_top_profile_wiget.dart';
import 'package:path/path.dart';

import '../widget/app_bar_change_theme.dart';
import '../widget/wiget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ModelUser user = UserPreferences.getUser();
  User users = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        drawer: const SideMenu(),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                coverImagePath: user.coverImagePath,
                onClicked: () async {
                  final picker = ImagePicker();
                  final XFile? pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 100,
                  );
                  if (pickedFile == null) {
                    print('No selecciono nada');
                    return;
                  }
                  final directory = await getApplicationDocumentsDirectory();
                  final name = basename(pickedFile.path);
                  final imageFile = File('${directory.path}/$name');
                  final newImage = File(imageFile.path);
                  setState(() => user = user.copy(imagePath: newImage.path));
                }),
            TexFieldWidget(
                label: 'Nick',
                text: user.name,
                onChanged: (name) => user = user.copy(name: name)),
            const SizedBox(height: 10),
            TexFieldWidget(
              label: 'About',
              text: user.about,
              onChanged: (about) => user = user.copy(about: about),
              maxLines: 6,
            ),
            ButtonWidget(
                text: 'Guardar',
                onClicked: () {
                  UserPreferences.setUser(user);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Homescreen()));
                  setState(() {});
                })
          ],
        ),
      );
}
