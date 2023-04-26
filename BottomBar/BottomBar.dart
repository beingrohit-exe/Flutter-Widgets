import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inforing_app/HomePage/HomeScreen.dart';
import 'package:inforing_app/Utils/Dimensions.dart';

class BottomBar extends StatefulWidget {
  static const String RouteName = "/bottom-bar";
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  List<Widget> pages = [
    HomeScreen(),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      child: const Center(
        child: Text('Page 2'),
      ),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.teal,
      child: const Center(
        child: Text('Page 3'),
      ),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.deepPurple,
      child: const Center(
        child: Text('Page 4'),
      ),
    ),
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Favorite',
    'Settings',
    'Account',
  ];

  @override
  Widget build(BuildContext context) {
    void updatePage(int page) {
      setState(() {
        _page = page;
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: pages[_page],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width16,
                  vertical: Dimensions.height10),
              height: Dimensions.height70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(Dimensions.height40)),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      _page = index;
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: _page == index
                            ? Dimensions.screenWidth * 0.32
                            : Dimensions.screenWidth * 0.18,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: _page == index ? Dimensions.height50 : 0,
                          width: _page == index
                              ? Dimensions.screenWidth * 0.32
                              : 0,
                          decoration: BoxDecoration(
                              color: _page == index
                                  ? Colors.deepPurpleAccent.withOpacity(0.2)
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height50)),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: _page == index
                            ? Dimensions.screenWidth * 0.31
                            : Dimensions.screenWidth * 0.18,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: _page == index
                                      ? Dimensions.screenWidth * 0.128
                                      : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index == _page ? 1 : 0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                    '${listOfStrings[index]}',
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == _page
                                      ? Dimensions.screenWidth * .03
                                      : Dimensions.width20,
                                ),
                                Icon(
                                  listOfIcons[index],
                                  color: _page == index
                                      ? Colors.deepPurple
                                      : Colors.black26,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
