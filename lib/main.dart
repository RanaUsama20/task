import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/auth/HomeScreen.dart';
import 'auth/login_screen.dart';
import 'auth/register_screen.dart';
import 'firebase_options.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RegisterScreen.routeName ,
            routes: {
              RegisterScreen.routeName: (context) => RegisterScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),

            },);
        }
  }
