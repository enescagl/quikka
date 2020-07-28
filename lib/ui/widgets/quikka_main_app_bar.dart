import 'package:flutter/material.dart';
import 'package:quikka/core/models/user.dart';

class QuikkaMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User user;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => Size.fromHeight(170.0);

  QuikkaMainAppBar({@required this.user, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipPath(
        clipper: _QuikkaCustomHeaderClipper(),
        child: Container(
          color: Colors.grey[300],
          width: preferredSize.width,
          height: preferredSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 36,
                      backgroundImage: NetworkImage(user.imageUrl),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            user.fullName,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(user.appName),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuikkaCustomHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 36);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondEndPoint = Offset(size.width, size.height - 36);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_QuikkaCustomHeaderClipper oldClipper) => false;
}
