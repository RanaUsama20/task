import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget{
  static String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Center(
           child: Text('auth done as ${user?.email}', style: TextStyle(fontSize: 20),),
         ),
         Padding(
           padding: EdgeInsets.all(40),
           child: ElevatedButton(
             onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamed(LoginScreen.routeName);

             },
             style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.purple,
                 shape: RoundedRectangleBorder(
                     borderRadius:
                     BorderRadius.all(Radius.circular(15)))),
             child: SizedBox(
               height: 64,
               width: 398,
               child: Center(
                 child: Text(
                   'sign out',
                   style: TextStyle(
                       fontSize: 20,
                       color: Colors.white
                   ),
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