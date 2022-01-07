import 'package:contact_app/pages/contact_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: 2,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.star_fill), label: "Favourites"),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.clock_fill),
              label: "Recents",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_crop_circle),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
              label: "Keypad",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.recordingtape),
              label: "Voicemail",
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return ContactPage();
        },
      ),
    );
  }
}
