import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/widget/constume_top_profile.dart';
import 'package:rock_med/widget/wiget.dart';
import '../providers/providers.dart';

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
    final topMenu = coverHeight - profileHeight / 100;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Stack(
          children: [
            buildCoverImage(userPrefece, onClicked, coverHeight),
            Positioned(
              top: top,
              child: Row(children: [
                ProfileWidget(
                    imagePath: userPrefece.imagePath,
                    onClicked: () async {},
                    coverImagPath: userPrefece.coverImagPath),
                Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: buildName(userPrefece)),
              ]),
            ),
          ],
        ),
        MenuButton(contumenButom: contumenButom)
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

  Widget buildCoverImage(userPreferece, onClicked, coverHeight) {
    final image = NetworkImage(userPreferece.coverImagPath);
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
}




/*
Stack builTop(double top) {
  return Stack(clipBehavior: Clip.none, children: [
    buildCoverImage(
        'https://media.tenor.com/images/7f0ef936a94e093d1355859ca7da5c82/tenor.png'),
    Positioned(
        top: top,
        child: buildProfileImage(
            'https://media.tenor.com/images/7f0ef936a94e093d1355859ca7da5c82/tenor.png')),
  ]);
}

Widget buildCoverImage(coverHeight) => Container(
      color: AppTheme.primary,
      child: Image.network(
        'https://media.tenor.com/images/7f0ef936a94e093d1355859ca7da5c82/tenor.png',
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
*/