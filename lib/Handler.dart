// @dart=2.8
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:welcome/pages/backButtonClose.dart';
import 'package:welcome/screens/lohin.dart';
import 'package:welcome/screens/newsScreen.dart';

// class InitializerWidget extends StatefulWidget {
//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }

// class _InitializerWidgetState extends State<InitializerWidget> {
//   FirebaseAuth _auth;

//   User _user;

//   bool isLoading = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth?.currentUser;
//     isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : _user == null
//             ? PhoneLogin()
//             : HomePage(
//                 user: _user,
//               );
//   }
// }
class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User user;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    User _user = _firebaseAuth.currentUser;
    setState(() {
      user = _user;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      body: user != null
          ? OutsideDoor()

          // HomePage(
          //     user: user,
          //   )
          : PhoneLogin(),
    );
  }
}
