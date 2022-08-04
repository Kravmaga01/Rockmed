import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/shere_preferences/preferences.dart';
import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/widget/app_bar_change_theme.dart';
import 'package:rock_med/widget/constume_top_profile_wiget.dart';
import 'package:rock_med/widget/wiget.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';

class Homescreen extends StatelessWidget {
  Homescreen({
    Key? key,
    required this.user,
    required this.onClicked,
  }) : super(key: key);

  User user;
  final userPrefece = UserPreferences.myUser;
  final double coverHeight = 220;
  final double profileHeight = 220;
  final VoidCallback onClicked;
  final double contumenButom = 87;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: const SideMenu(),
      body: Stack(children: [
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                buildCoverImage(onClicked, coverHeight),
                Positioned(
                  top: top,
                  child: Row(children: [
                    ProfileWidget(
                      imagePath: Preferences.imagePath,
                      onClicked: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const EditProfileScreen())),
                      coverImagPath: Preferences.coverImagePath,
                      isEdit: false,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: buildName(userPrefece)),
                  ]),
                ),
              ],
            ),
            buildAbout(),
          ],
        ),
      ]),
    );
  }

  Widget buildInfomation(funtione, index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: AppTheme.second,
      child: Container(
        child: funtione,
      ));

  Widget buildName(userPreferences) => Column(
        children: [
          Text(
            userPrefece.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text('${user.email}'),
        ],
      );

  Widget buildCoverImage(onClicked, coverHeight) {
    final image = NetworkImage(Preferences.coverImagePath);
    return Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
          child: InkWell(
            onTap: onClicked,
          ),
        ));
  }

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'AboutMe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              Preferences.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            )
          ],
        ),
      );
}
