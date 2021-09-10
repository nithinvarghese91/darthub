import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 7,
            ),
            GestureDetector(
              child: Transform.scale(
                scale: 1,
                child: SvgPicture.asset('assets/svg/arrow.svg'),
              ),
              onTap: () {
                Navigator.pop(context);
                print('backbutton pressed');
              },
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Gst News',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 6.5),
              decoration: BoxDecoration(

                  //boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(.40), //color of shadow
                  //     spreadRadius: 1, //spread radius
                  //     blurRadius: 0.10, // blur radius
                  //     // offset: Offset(1, 1)
                  //   )
                  // ]
                  ),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * .40,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset('assets/svg/image1.jpg',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill),
                    ),
                    // SizedBox(
                    //   height: 18,
                    // ),
                    Spacer(
                      flex: 4,
                    ),
                    Text("Centre Releases Rs.1.04 lakh Crore for",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),

                    Spacer(
                      flex: 1,
                    ),
                    Text("Compensation Shortfall under GST",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),

                    Spacer(
                      flex: 3,
                    ),
                    Row(
                      children: [
                        Text("Updated March 02, 2021     2 Min Read",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            )),
                        Spacer(
                          flex: 5,
                        ),
                        Text("0 comments",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            )),
                        // Spacer(
                        //   flex: 3,
                        // ),
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  'The Centre has released Rs 1.04 lakh crore to states in four months since October 2020, to meet GST compensation shortfall.the finance ministry said on Monday.',
                  style: TextStyle(
                      color: Color(0xffff323C45),
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      fontFamily: 'Inria'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
