import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:errands/constants/colors.dart';
import 'package:errands/tabs/home_tab.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
    HomePage({Key key}) : super(key: key);

    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    int _currentIndex = 0;
    PageController _pageController;
    String _appBarTitle = 'Home';

    @override
    void initState() {
        super.initState();
        _pageController = PageController();
    }

    @override
    void dispose() {
        _pageController.dispose();
        super.dispose();
    }

    final tabs = <Widget>[
        HomeTab(),
        Container(
            color: Colors.red,
            child: Center(
                child: Text('Calendar'),
            ),
        ),
        Container(
            color: Colors.green,
            child: Center(
                child: Text('Notifications'),
            ),
        ),
        Container(
            color: Colors.blue,
            child: Center(
                child: Text('Ongoing Errands'),
            ),
        ),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: _buildAppBar(),
            backgroundColor: Colors.white,
            body: WillPopScope(
                onWillPop: () async {
                    return Future.value(true);
                },
                child: SizedBox.expand(
                    child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                            setState(() {
                                _currentIndex = index;
                                updateAppBatTitle(index);
                            });
                        },
                        children: tabs
                    ),
                ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                currentIndex: _currentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: primaryColPink,
                unselectedItemColor: primaryColPink.withOpacity(0.3),
                // type: BottomNavigationBarType.shifting,
                items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                            LineIcons.home,
                            size: 30,
                        ),
                        backgroundColor: Colors.white,
                        title: Text('Home'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                            LineIcons.calendar_minus_o,
                            size: 30,
                        ),
                        backgroundColor: Colors.white,
                        title: Text('Schedule'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                            LineIcons.paper_plane_o,
                            size: 30,
                        ),
                        backgroundColor: Colors.white,
                        title: Text('Notifications'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                            LineIcons.arrow_right,
                            size: 30,
                        ),
                        backgroundColor: Colors.white,
                        title: Text('Settings'),
                    ),
                ],
                onTap: (index) {
                    bottomTapped(index);
                    updateAppBatTitle(index);
                },
            ),
        );
    }

    void bottomTapped(int index) {
        setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
        });
    }

    void updateAppBatTitle(int index) {
        switch(index) {
            case 0:  _appBarTitle = 'Home';
            break;
            case 1: _appBarTitle = 'Calendar';
            break;
            case 2:  _appBarTitle = 'Chat';
            break;
            case 3:  _appBarTitle = 'Share';
            break;
        }
    }

    _buildAppBar() {
        return PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    elevation: 0,
                    leading: Container(
                        padding: EdgeInsets.only(
                            left: 30,
                            top: 10,
                            bottom: 10,
                        ),
                        child: SvgPicture.asset(
                            'assets/svg/menu.svg',
                        ),
                    ),
                    title: Text(
                        _appBarTitle,
                        style: GoogleFonts.montserrat(
                            color: textColDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                    ),
                    actions: [
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: avatarBgCol,
                            child: ClipOval(
                                child: Transform.rotate(
                                    angle: 0.3,
                                    child: Image.asset(
                                        'assets/images/avatar_1.png',
                                        height: 35,
                                        width: 35,
                                    ),
                                )
                            ),
                        )
                    ],
                ),
            )
        );
    }
}
