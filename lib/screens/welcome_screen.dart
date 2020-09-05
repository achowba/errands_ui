import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import 'package:errands/constants/colors.dart';
import 'package:errands/screens/home_page.dart';

class WelcomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: primaryColPink,
            body: Container(
                padding: EdgeInsets.only(
                    top: 0
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        Text(
                            'We\'re the\nErrand Boys',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600
                            ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                            'We basically do all your\n errands for you',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300
                            ),
                        ),
                        SizedBox(height: 20,),
                        InkWell(
                            child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: primaryColPink,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white60,
                                    ),
                                ),
                                child: Center(
                                    child: Icon(
                                        LineIcons.arrow_right,
                                        color: Colors.white60,
                                    ),
                                ),
                            ),
                            onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => HomePage()),
                                );
                            },
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Align(
                                child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/welcome_illustration_2.png'),
                                            alignment: Alignment.bottomCenter
                                        ),
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
