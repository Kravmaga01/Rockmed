import 'package:flutter/material.dart';
import 'package:rock_med/main.dart';
import 'package:rock_med/models/model_user.dart';
import 'package:rock_med/services/services.dart';
import 'package:rock_med/widget/constume_top_profile_wiget.dart';

import '../widget/app_bar_change_theme.dart';
import '../widget/wiget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ModelUser user = UserPreferences.myUser;
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
                coverImagePath: user.coverImagePath),
            TexFieldWidget(
                label: 'Nick', text: user.name, onChanged: (name) {}),
            const SizedBox(height: 10),
            TexFieldWidget(
              label: 'About',
              onChanged: (name) {},
              text: user.about,
              maxLines: 6,
            ),
          ],
        ),
      );
}
