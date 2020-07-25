import 'package:flutter/material.dart';
import 'package:quikka/core/models/competitor.dart';

class LeaderboardRow extends StatelessWidget {
  final Competitor competitor;

  LeaderboardRow({this.competitor});
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(competitor.imageUrl),
            ),
            Text(competitor.appName),
          ],
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('${competitor.point} P'),
            Text(competitor.rank),
          ],
        ),
      )
    ]);
  }
}
