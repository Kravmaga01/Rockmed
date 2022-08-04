import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/widget/app_bar_change_theme.dart';
import 'package:rock_med/widget/constume_top_profile_wiget.dart';
import 'package:rock_med/widget/wiget.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final userPrefece = UserPreferences.getUser();

  final double coverHeight = 220;

  final double profileHeight = 220;

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
                buildCoverImage(userPrefece, coverHeight),
                Positioned(
                  top: top,
                  child: Row(children: [
                    ProfileWidget(
                      imagePath: userPrefece.imagePath,
                      onClicked: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditProfileScreen()));
                        setState(() {});
                      },
                      coverImagePath: userPrefece.coverImagePath,
                      isEdit: false,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: buildName()),
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

  Widget buildName() => Column(
        children: [
          Text(
            userPrefece.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text('${widget.user.email}'),
        ],
      );

  Widget buildCoverImage(userPreference, coverHeight) {
    final image = NetworkImage(userPrefece.coverImagePath);
    return Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
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
              userPrefece.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            )
          ],
        ),
      );
}
