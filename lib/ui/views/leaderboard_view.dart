import 'package:flutter/material.dart';
import 'package:quikka/core/models/competitor.dart';
import 'package:quikka/core/models/user.dart';
import 'package:quikka/ui/widgets/leaderboard_row.dart';
import 'package:quikka/ui/widgets/quikka_leaderboard_app_bar.dart';

class LeaderboardView extends StatelessWidget {
  final User _user = User(
    appName: '@tomhardy',
    fullName: 'Tom Hardy',
    id: 1,
    imageUrl:
        'https://www.sacintarzin.com/sites/default/files/styles/article_slider/public/media/2017/02/ready-to-relax-650x813.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuikkaLeaderboardAppBar(user: _user),
      body: SingleChildScrollView(
        child: Column(
          children: _competitors.map(
            (comp) {
              return LeaderboardRow(competitor: comp);
            },
          ).toList(),
        ),
      ),
    );
  }
}

var _competitors = [
  Competitor(
    appName: '@tomhardy',
    fullName: 'Tom Hardy',
    id: 1,
    imageUrl:
        'https://www.sacintarzin.com/sites/default/files/styles/article_slider/public/media/2017/02/ready-to-relax-650x813.jpg',
    point: '1000',
    rank: '1st',
    solvedQuizCount: '32',
  ),
  Competitor(
    appName: '@second',
    fullName: 'Second',
    id: 2,
    imageUrl:
        'https://www.sacintarzin.com/sites/default/files/styles/article_slider/public/media/2017/02/ready-to-relax-650x813.jpg',
    point: '1000',
    rank: '2nd',
    solvedQuizCount: '32',
  ),
  Competitor(
    appName: '@third',
    fullName: 'Third',
    id: 3,
    imageUrl:
        'https://www.sacintarzin.com/sites/default/files/styles/article_slider/public/media/2017/02/ready-to-relax-650x813.jpg',
    point: '1000',
    rank: '3rd',
    solvedQuizCount: '32',
  ),
  Competitor(
    appName: '@forth',
    fullName: 'Forth',
    id: 4,
    imageUrl:
        'https://www.sacintarzin.com/sites/default/files/styles/article_slider/public/media/2017/02/ready-to-relax-650x813.jpg',
    point: '1000',
    rank: '4th',
    solvedQuizCount: '32',
  ),
  Competitor(
    appName: '@fifth',
    fullName: 'Fifth',
    id: 5,
    imageUrl:
        'https://www.sacintarzin.com/sites/default/files/styles/article_slider/public/media/2017/02/ready-to-relax-650x813.jpg',
    point: '1000',
    rank: '5th',
    solvedQuizCount: '32',
  ),
];
