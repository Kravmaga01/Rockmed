import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/widget/constume_top_profile.dart';

import '../providers/providers.dart';

class Homescreen extends StatelessWidget {
  Homescreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  User user;
  final userPrefece = UserPreferences.myUser;
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ProfileWidget(imagePath: userPrefece.imagePath, onClicked: () async {}),
        const SizedBox(height: 24),
        buildName(userPrefece),
      ],
    );
  }

  Widget buildName(userPreferences) => Column(
        children: [
          Text(
            userPrefece.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      );
}

Stack builTop(double top) {
  return Stack(clipBehavior: Clip.none, children: [
    buildCoverImage(''),
    Positioned(top: top, child: buildProfileImage('')),
  ]);
}

Widget buildCoverImage(coverHeight) => Container(
      color: AppTheme.primary,
      child: Image.network(
        'https://i.scdn.co/image/ab67616d0000b273482c43a36394309c8ee09b38',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
Widget buildProfileImage(profileHeight) => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: AppTheme.primary,
      backgroundImage: const NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-Ja63pG-b1ebiic3ZwhA891LcdOW-UnYoqw&usqp=CAU'),
    );
