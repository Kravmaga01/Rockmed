import 'package:flutter/material.dart';
import 'package:rock_med/models/model_user.dart';
import 'package:rock_med/services/services.dart';
import 'package:rock_med/widget/constume_top_profile_wiget.dart';

import '../widget/app_bar_chance_theme.dart';
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
                onClicked: () {},
                coverImagPath: user.coverImagPath)
          ],
        ),
      );
}
