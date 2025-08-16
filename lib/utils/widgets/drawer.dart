import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final imageUrl = "https://media.licdn.com/dms/image/v2/D5603AQGTcJU3DtIFYg/profile-displayphoto-shrink_200_200/B56ZdDZ3leG0Ac-/0/1749182546092?e=2147483647&v=beta&t=1R4iECEeadOysg8f4Y4yGBamISWW_JQqu5BEEyaF42Y";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Prem Zade"), 
                accountEmail: Text("zadeprem1234@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                size: 28,
              ),
              title: Text(
                "Home",
                // ignore: deprecated_member_use
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                size: 28,
              ),
              title: Text(
                "Profile",
                // ignore: deprecated_member_use
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
                size: 28,
              ),
              title: Text(
                "Email me",
                // ignore: deprecated_member_use
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}