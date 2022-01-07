import 'package:contact_app/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: "Contacts",
          trailing: Text(
            "Edit",
            style: TextStyle(color: CupertinoTheme.of(context).primaryColor),
          ),
        ),
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
            return Container(
              color: CupertinoColors.lightBackgroundGray,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 10),
                        CircleAvatar(
                            child: Text(
                              contact.firstName[0],
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.white,
                              ),
                            ),
                            radius: 35,
                            backgroundColor: CupertinoColors.systemGrey3),
                        const SizedBox(height: 10),
                        Text(
                          "${contact.firstName} ${contact.lastName}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Wrap(
                          spacing: 8,
                          children: [
                            Container(
                              width: 75,
                              height: 55,
                              // padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    color:
                                        CupertinoTheme.of(context).primaryColor,
                                  ),
                                  Text(
                                    "message",
                                    style: TextStyle(
                                      color: CupertinoTheme.of(context)
                                          .primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 55,
                              // padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.phone_fill,
                                    color:
                                        CupertinoTheme.of(context).primaryColor,
                                  ),
                                  Text(
                                    "call",
                                    style: TextStyle(
                                      color: CupertinoTheme.of(context)
                                          .primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 55,
                              // padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.video_camera_solid,
                                    color:
                                        CupertinoTheme.of(context).primaryColor,
                                  ),
                                  Text(
                                    "WhatsApp",
                                    style: TextStyle(
                                      color: CupertinoTheme.of(context)
                                          .primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 55,
                              // padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    CupertinoIcons.mail_solid,
                                    color: CupertinoColors.systemGrey5,
                                  ),
                                  Text(
                                    "mail",
                                    style: TextStyle(
                                      color: CupertinoColors.systemGrey5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("mobile"),
                              Text(
                                "+${contact.phoneNumber}",
                                style: TextStyle(
                                  color:
                                      CupertinoTheme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 160,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("Notes")],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Send  Message",
                                style: TextStyle(
                                  color:
                                      CupertinoTheme.of(context).primaryColor,
                                ),
                              ),
                              Divider(),
                              Text(
                                "Share Contact",
                                style: TextStyle(
                                  color:
                                      CupertinoTheme.of(context).primaryColor,
                                ),
                              ),
                              Divider(),
                              Text(
                                "Add to Favourites",
                                style: TextStyle(
                                  color:
                                      CupertinoTheme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
