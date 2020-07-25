import 'package:flutter/material.dart';
import 'package:quikka/core/constants/route_paths.dart';
import 'package:quikka/core/models/user.dart';

class QuikkaNavigationDrawer extends StatelessWidget {
  final User user;

  QuikkaNavigationDrawer({this.user});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _QuikkaDrawerClipper(),
      child: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36.0),
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 36,
                      backgroundImage: NetworkImage(this.user.imageUrl),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            this.user.fullName,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(this.user.appName),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(
                "My Account",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(
                "Quiz History",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(
                "Leaderboard",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.LeaderBoardRoute);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(
                "Share",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _QuikkaDrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width - 30, size.height);
    path.lineTo(size.width - 30, size.height - (size.height * 4) / 6);
    path.lineTo(size.width, size.height - (size.height * 4) / 6);
    // var firstControlPoint = Offset(size.width, size.height - (size.height * 4) / 6);
    // var firstEndPoint = Offset(size.width, size.height - (size.height * 4) / 6);
    // path.quadraticBezierTo();
    path.lineTo(size.width, size.height - ((size.height * 4) / 6) - 45);
    path.lineTo(size.width - 30, size.height - ((size.height * 4) / 6) - 45);
    path.lineTo(size.width - 30, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_QuikkaDrawerClipper clipper) {
    return false;
  }
}
