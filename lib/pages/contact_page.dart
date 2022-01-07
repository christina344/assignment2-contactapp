import 'dart:convert';

import 'package:contact_app/data/contacts_json.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/pages/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                leading: Text(
                  "Groups",
                  style: TextStyle(
                    color: CupertinoTheme.of(context).primaryColor,
                  ),
                ),
                middle: const Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  CupertinoIcons.add,
                ),
                largeTitle: CupertinoSearchTextField(),
                // stretch: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        children: [
                          const CircleAvatar(),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Christina Arthur",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "My Card",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ...alphabets.map((group) {
                List<Contact> contactGroup = getContactGroup(group);
                return SliverStickyHeader(
                  header: Container(
                    color: CupertinoColors.opaqueSeparator,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(group),
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        String fullName =
                            "${contactGroup[i].firstName} ${contactGroup[i].lastName}";
                        return GestureDetector(
                          onTap: () {
                            Contact contact = contactGroup[i];
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        DetailsPage(contact: contact)));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.only(left: 16, bottom: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: Text(fullName),
                          ),
                        );
                      },
                      childCount: contactGroup.length,
                    ),
                  ),
                );
              }).toList()
            ],
          ),
          Positioned(
              right: 0,
              top: 150,
              bottom: 0,
              child: SizedBox(
                // height: 60,
                width: 20,
                child: ScrollablePositionedList.builder(
                    shrinkWrap: true,
                    itemCount: alphabets.length,
                    itemBuilder: (context, index) {
                      return Text(
                        alphabets[index],
                        style: TextStyle(
                            color: CupertinoTheme.of(context).primaryColor),
                      );
                    }),
              ))
        ],
      ),
    );
  }

  getContactGroup(String group) {
    return allContacts
        .map((e) => Contact.fromJson(e))
        .where((contact) => contact.firstName.toUpperCase().startsWith(group))
        .toList();
  }
}
