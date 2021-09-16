// @dart=2.8

import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:welcome/screens/newsScreen.dart';
import './newsScreen.dart';
//import 'package:pin_input_text_field/pin_input_text_field.dart';

import 'dart:ui';

import 'OTPiinput.dart';

class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  OTPScreen({
    Key key,
    @required this.mobileNumber,
  })  : assert(mobileNumber != null),
        super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${widget.mobileNumber.length}");
    if (widget.mobileNumber.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();

  /// Decorate the outside of the Pin.
  // PinDecoration _pinDecoration = UnderlineDecoration(
  //   color: Colors.white,
  //   gapSpace: 59,
  // );
  PinDecoration _pinDecoration = BoxLooseDecoration(
      strokeColor: Colors.grey, radius: Radius.circular(5.0), gapSpace: 10);

  bool isCodeSent = false;
  String _verificationId;
  String medHeight = 'MediaQuery.of(context).size.height  ';
  String MedWidth = 'MediaQuery.of(context).size.width ';
  int i;

  Hello() {
    Future.delayed(Duration(seconds: 13), () {
      setState(() {
        if (_pinEditingController.text.length == 6) {
          _onFormSubmitted();
        } else {
          showToast("Invalid OTP", Colors.red);
        }
      });

      // Do something
    });
  }

  @override
  void initState() {
    super.initState();
    _onVerifyCode();
    // if (_pinEditingController.text.length == 6) {
    //   _onFormSubmitted();
    // } else {
    //   showToast("Invalid OTP", Colors.red);
    // }
    setState(() {
      // for (i = 0; i > 0; i++) {
      //   if (i > 6) {
      //     i = i - 1;
      //   } else if (i == 6) {
      //     if (i == _pinEditingController.text.length) {
      //       _onFormSubmitted();
      //     }
      //   }
      // }
      Hello();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("isValid - $isCodeSent");
    print("mobiel ${widget.mobileNumber}");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //     ),
      //     color: Colors.white,
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   bottom: PreferredSize(
      //     child: Container(
      //       padding: EdgeInsets.only(left: 16.0, bottom: 16, top: 4),
      //       color: Colors.white,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Text(
      //                 "Verify Details",
      //                 style: TextStyle(
      //                     fontSize: 22.0, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 height: 8,
      //               ),
      //               Text(
      //                 "OTP sent to ${widget.mobileNumber}",
      //                 style: TextStyle(
      //                     fontSize: 16.0, fontWeight: FontWeight.bold),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     preferredSize: Size.fromHeight(100),
      //   ),
      // ),
      body:
          //  SingleChildScrollView(
          //   child:
          SafeArea(
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Text(
              "Enter Verification code",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),

            SizedBox(
              height: 16,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1,
                  child: SvgPicture.asset('assets/svg/lock.svg'),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "We have send OTP to your number",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 90 / 100,
                  child: PinInputTextField(
                    pinLength: 6,
                    decoration: _pinDecoration,
                    controller: _pinEditingController,
                    autoFocus: true,
                    textInputAction: TextInputAction.done,
                    onSubmit: (pin) {
                      if (pin.length == 6) {
                        _onFormSubmitted();
                      } else {
                        showToast("Invalid OTP", Colors.red);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont receive a OTP ?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    validate((fn) {});
                  },
                  child: Text(
                    "Resend OTP ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "by confirming OTP you agree to our",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Terms & Conditions",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 520, left: 4),
            //   child: Center(
            //     child: SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.8,
            //       child: RaisedButton(
            //         color: Theme.of(context).primaryColor,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(0.0)),
            //         child: Text(
            //           "ENTER OTP",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 18.0,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         onPressed: () {
            //           if (_pinEditingController.text.length == 6) {
            //             _onFormSubmitted();
            //           } else {
            //             showToast("Invalid OTP", Colors.red);
            //           }
            //         },
            //         padding: EdgeInsets.all(16.0),
            //       ),
            //     ),
            //   ),
            // ),
            Spacer(
              flex: 7,
            ),
          ],
        ),
      ),
      // ),
    );
  }

  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onVerifyCode() async {
    setState(() {
      isCodeSent = true;
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((UserCredential value) {
        if (value.user != null) {
          // Handle loogged in state
          print(value.user.phoneNumber);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  user: value.user,
                ),
              ),
              (Route<dynamic> route) => false);
        } else {
          showToast("Error validating OTP, try again", Colors.red);
        }
      }).catchError((error) {
        showToast("Try again in sometime", Colors.red);
      });
    };
    final PhoneVerificationFailed verificationFailed = (authException) {
      showToast(authException.message, Colors.red);
      setState(() {
        isCodeSent = false;
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

    // TODO: Change country code

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+91${widget.mobileNumber}",
        timeout: const Duration(seconds: 120),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void _onFormSubmitted() async {
    AuthCredential _authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: _pinEditingController.text);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((UserCredential value) {
      if (value.user != null) {
        // Handle loogged in state
        print(value.user.phoneNumber);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                user: value.user,
              ),
            ),
            (Route<dynamic> route) => false);
      } else {
        showToast("Error validating OTP, try again", Colors.red);
      }
    }).catchError((error) {
      showToast("Something went wrong", Colors.red);
    });
  }
}
