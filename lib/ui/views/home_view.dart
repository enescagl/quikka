import 'package:flutter/material.dart';

import 'package:quikka/core/models/user.dart';
import 'package:quikka/ui/widgets/categories_box.dart';
import 'package:quikka/ui/widgets/quikka_navigation_drawer.dart';
import 'package:quikka/ui/widgets/statistics_box.dart';
import 'package:quikka/ui/widgets/quikka_main_app_bar.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
      key: _scaffoldKey,
      drawer: QuikkaNavigationDrawer(
        user: _user,
      ),
      appBar: QuikkaMainAppBar(scaffoldKey: _scaffoldKey, user: _user),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 72.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: <Widget>[
              statsRow(),
              buttonsRow(),
              CategoriesBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonsRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
            onPressed: () {},
            child: Text('Random Quiz'),
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
            onPressed: () {},
            child: Text('Latest Quiz'),
          ),
        ],
      ),
    );
  }

  Widget statsRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: StatisticsBox(
            height: 110,
            position: StatisticsBoxPosition.left,
            header: Text(
              'Total Solved Quizes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
            body: Text(
              '28',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        VerticalDivider(
          indent: 10,
          endIndent: 10,
          width: 1,
        ),
        Expanded(
          child: StatisticsBox(
            height: 110,
            position: StatisticsBoxPosition.left,
            header: Text(
              'Your Rank',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
            body: Text(
              '32',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
