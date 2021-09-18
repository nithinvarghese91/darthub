import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Terms & Conditions',
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
        padding: EdgeInsets.all(20),
        child: Text(
            'There are many variations of passages, of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn,t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
            style: TextStyle(
              color: Color(0xFFFF939393),
              fontSize: 12,
              fontFamily: 'inter',
            )),
      ),
    );
  }
}
