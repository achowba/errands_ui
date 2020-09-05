import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:errands/constants/colors.dart';
import 'package:errands/constants/styles.dart';

class HomeTab extends StatelessWidget {
    @override
    Widget build (BuildContext context) {
        return ListView(
            scrollDirection: Axis.vertical,
            children: [
                _buildText('Scheduled Errands'),
                Container(
                    height: 260,
                    margin: EdgeInsets.fromLTRB(40, 0, 0, 30),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    color: Colors.transparent,
                    child: ListView(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                            _buildScheduledErrands(primaryColPink, 'assets/images/', 'Drive', 'Lekki Tour', '09 AUG - 07:35',),
                            _buildScheduledErrands(primaryColBlue, 'assets/images/', 'Shop', 'Wine', '09 AUG - 07:35',),
                            _buildScheduledErrands(avatarBgCol, 'assets/images/', 'Gym', 'Work Out', '10 AUG - 07:00',),
                        ],
                    ),
                ),
                _buildText('Outgoing Errands'),
                _buildOngoingErrands(primaryColPink, 'assets/images/', 'Veggies', 'Shop',),
                _buildOngoingErrands(primaryColGreen, 'assets/images/', 'Pipe Repair', 'Handy Man'),
                _buildOngoingErrands(primaryColBlue, 'assets/images/', 'V.I Tour', 'Drive'),
                _buildOngoingErrands(primaryColPink, 'assets/images/', 'Veggies', 'Shop',),
                _buildOngoingErrands(primaryColGreen, 'assets/images/', 'Pipe Repair', 'Handy Man'),
                _buildOngoingErrands(primaryColGreen, 'assets/images/', 'V.I Tour', 'Drive'),
            ],
        );
    }

    Widget _buildText(text) {
        return Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 0, 30),
            child: Text(
                text,
                style: sectionTextStyle
            ),
        );
    }

    Widget _buildScheduledErrands(Color bgColor, String imgPath, String name, String description, String time) {
        return Container(
            width: 250,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)
                        ),
                    ),
                    SizedBox(height: 30,),
                    Text(
                        name,
                        style: GoogleFonts.montserrat(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                        description,
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                        time,
                        style: GoogleFonts.montserrat(
                            color: Colors.white60,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                    ),
                ],
            ),
        );
    }

    Widget _buildOngoingErrands(Color bgColor, String imgPath, String name, String description) {
        return Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            width: double.infinity,
            // color: Colors.red,
            child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Row(
                        children: [
                            Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    color: bgColor.withOpacity(0.3),
                                    shape: BoxShape.circle
                                ),
                            ),
                            SizedBox(width: 15,),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                        name,
                                        style: GoogleFonts.montserrat(
                                            color: textColDark,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500
                                        ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                        description,
                                        style: GoogleFonts.montserrat(
                                            color: textColDark.withOpacity(0.4),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                    ),
                                ],
                            ),
                        ],
                    ),
                    InkWell(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(25, 14, 25, 14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3),
                                )
                            ),
                            child: Center(
                                child: Text(
                                    'Track',
                                    style: GoogleFonts.montserrat(
                                        color: textColDark,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                    ),
                                ),
                            ),
                        ),
                        onTap: () {},
                    )
                ],
            ),
        );
    }
}
