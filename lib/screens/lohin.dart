// @dart=2.8

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:welcome/provider/demoProvider.dart';

import './otpScreen.dart';
import 'package:flutter/material.dart';
import 'package:welcome/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:welcome/screens/newsScreen.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

//from old screen
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;

  void signInAnonymously() {
    _auth.signInAnonymously().then((result) {
      setState(() {
        final User user = result.user;
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        user: user,
                      )));
        }
      });
    });
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      user: null,
                    )));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      var _scaffoldKey;
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

//old screen ends here

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(17),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter state) {
              return
                  // SingleChildScrollView(
                  //     child:
                  Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Transform.scale(
                        scale: .84,
                        child:
                            SvgPicture.asset('assets/svg/Pattern_light 1.svg'),
                      ),
                      Spacer(
                        flex: 12,
                      )
                    ],
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: SvgPicture.asset('assets/svg/Group (1).svg'),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Text(
                        "ALL-IN-ONE GST PLATFORM",
                        style: TextStyle(
                            fontSize: 10,
                            letterSpacing: 1.2,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF323C45)),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Transform.scale(
                        scale: 1,
                        child:
                            SvgPicture.asset('assets/svg/Pattern_light 1.svg'),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's Get Started",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF323C45)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "India's most-trusted platform for GST Updated & Resources",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            wordSpacing: 2,
                            fontFamily: 'inter',
                            //letterSpacing: .5,
                            fontSize: 12,
                            color: Color(0xFFFF939393),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Enter Your Mobile Number",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF323C45)),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                  TextAreaValidation(context, state),
                  SizedBox(
                    height: 12,
                  ),
                  getOtp(context, state),
                  // skipButton(context),
                  Spacer(flex: 1)
                ],
                // )
              );
            },
          ),
        ),
      ),
    );
  }

  Container skipButton(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(
      //     top: MediaQuery.of(context).size.height * 87 / 100,
      //     left: MediaQuery.of(context).size.width * 38 / 100),
      child: TextButton(
          onPressed: () {
            print('anonymous sign in');
            setState(() {
              signInAnonymously();
            });
          },
          child: Text(
            "Skip",
            style: TextStyle(
              color: Colors.blue,
            ),
          )),
    );
  }

  Container getOtp(BuildContext context, StateSetter state) {
    return Container(
      child: Container(
        // margin: EdgeInsets.only(
        //   top: MediaQuery.of(context).size.height * 81 / 100,
        // ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xffff00866A),
        ),
        child: TextButton(
          onPressed: () {
            if (isValid) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPScreen(
                      mobileNumber: _phoneNumberController.text,
                    ),
                  ));
            } else {
              validate(state);
            }
          },
          child: Text(
            "Get OTP",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          // color: Colors.tealAccent[700],
          // minWidth: MediaQuery.of(context).size.width,
          // textColor: Colors.white,
        ),
      ),
    );
  }

  InkWell TextAreaValidation(BuildContext context, StateSetter state) {
    return InkWell(
      child: Container(
        height: 42,
        // margin: EdgeInsets.only(
        //   top: MediaQuery.of(context).size.height * textfld / 100,
        // ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(width: .5, color: Colors.grey[400]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
                child: Center(
                  child: Text(
                    '+91',
                    style: TextStyle(
                        fontSize: phonenum,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500]),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: .5, color: Colors.grey[400]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _phoneNumberController,
                  autofocus: true,
                  onChanged: (text) {
                    validate(state);
                  },
                  decoration: InputDecoration(
                    hintText: "     Phone Number",
                    contentPadding:
                        EdgeInsets.only(left: 14, bottom: 12, top: 12),
                    border: InputBorder.none,
                  ),
                  autovalidate: true,
                  autocorrect: false,
                  maxLengthEnforced: true,
                  validator: (value) {
                    return !isValid ? null : null;
                  },
                ),
              ),
              flex: 6,
            )
          ],
        ),
      ),
    );
  }
}
