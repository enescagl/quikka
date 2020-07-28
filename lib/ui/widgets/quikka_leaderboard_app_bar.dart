import 'package:flutter/material.dart';
import 'package:quikka/core/models/user.dart';

class QuikkaLeaderboardAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final User user;
  @override
  Size get preferredSize => Size.fromHeight(320.0);

  QuikkaLeaderboardAppBar({this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white70,
        width: preferredSize.width,
        height: preferredSize.height,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  iconSize: 24,
                  color: Colors.grey[900],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 42.0),
                    child: Text(
                      'Leaderboard',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[900],
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(user.imageUrl),
                    backgroundColor: Colors.transparent,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        user.fullName,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(user.appName),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Your Rank'),
                      Text('32'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Total Points'),
                      Text('125'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Solved Quizes'),
                      Text('28'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
