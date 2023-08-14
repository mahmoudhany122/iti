import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iti/profile.dart';

import 'aboutapp.dart';
import 'devlopers.dart';

class NavBarList extends StatelessWidget {
  NavBarList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('MahmoudHany'),
              accountEmail: const Text(
                "mh6263653@gmail.com",
              ),
              currentAccountPicture: const CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage(
                      "assets/images/mahmoud.jpg",
                    ),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onDetailsPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              // decoration: BoxDecoration(
              //   image:DecorationImage(
              //     image: (AssetImage("assets/images/",)
              //     ),
              //   ),
              // ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              title: Text('profile'),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.facebook,
                color: Colors.white,
              ),
              title: Text('facebook account'),
              textColor: Colors.white,
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.announcement_rounded,
              color: Colors.white),
              title: Text("About the app"),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfApp(),));

              },
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              title: Text('locatoin'),
              textColor: Colors.white,
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.share_rounded,
                color: Colors.white,
              ),
              title: Text("share the app"),
              textColor: Colors.white,
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.developer_mode,
                color: Colors.white,
              ),
              title: Text("devlopers"),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => devlop(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
              title: Text("exit from the app"),
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
