import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_new/controllers/helpers/Helpers.dart';
import 'package:portfolio_new/res.dart';

class PortFolioHome extends StatefulWidget {
  @override
  _PortFolioHomeState createState() => _PortFolioHomeState();
}

class _PortFolioHomeState extends State<PortFolioHome>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            SlideTransition(
              position: _offsetAnimation,
              child: SizedBox(
                width: compareMediaQuery(context, 300),
                height: MediaQuery.of(context).size.height,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 20,
                  color: Color.fromRGBO(49, 54, 59, 1),
                  child: Column(
                    children: [
                      sb(50),
                      CircleAvatar(
                        radius: compareMediaQuery(context, 100),
                        foregroundImage: AssetImage(Res.dp),
                      ),
                      sb(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sarthak",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 60,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            " Pathak",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      sb(50),
                      Chip(
                        avatar: FlutterLogo(),
                        padding: EdgeInsets.all(10),
                        label: Text(
                          "Flutter Developer",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      sb(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          socialIcons(
                              FontAwesomeIcons.linkedin, () => null, context),
                          socialIcons(
                              FontAwesomeIcons.instagram, () => null, context),
                          socialIcons(
                              FontAwesomeIcons.twitter, () => null, context),
                          socialIcons(
                              FontAwesomeIcons.github, () => null, context),
                        ],
                      ),
                      sb(50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

socialIcons(IconData icon, Function() onPressed, BuildContext context) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: FaIcon(
          icon,
          size: MediaQuery.of(context).size.width / 60,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
