import 'package:flutter/material.dart';
import 'package:task/auth/AppTextField.dart';
import 'package:task/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget{
  static String routeName = 'Register Screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100,),
            Text('Sign Up', style: TextStyle(
              color:  Colors.purple, fontSize: 30
            ),textAlign: TextAlign.center,),
            SizedBox(
              height:60 ,),
             Form(
               key: formKey,
                 child: Column(
                   children: [
                     AppTextField(
                         fieldName: 'username',
                         hintText: 'Enter your username',
                         controller: userNameController,
                       validator: (value){
                           if(value == null || value.trim().isEmpty){
                             return 'please enter your username';
                           }
                           return null;
                       },
                     ),
                     AppTextField(
                       fieldName: 'Email',
                       hintText: 'Enter your email',
                       controller: emailController,
                       validator: (value){
                         if(value == null || value.trim().isEmpty){
                           return 'please enter your email';
                         }
                         bool validEmail = RegExp(
                             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                             .hasMatch(value);
                         if (!validEmail) {
                           return 'invalid email';
                         }
                         return null;
                       },
                     ),
                     AppTextField(
                       fieldName: 'password',
                       hintText: 'Enter your password',
                       controller: passwordController,
                       validator: (value){
                         if(value == null || value.trim().isEmpty){
                           return 'please enter your password';
                         }
                         if (value.trim().length < 6) {
                           return 'password should be > 6 ';
                         }
                         return null;
                       },
                       keyboardType: TextInputType.visiblePassword,
                       isObscure:  isObscure,
                       suffixIcon: InkWell(
                         child:  isObscure
                             ? Icon(Icons.visibility_off)
                             : Icon(Icons.visibility),
                         onTap: () {
                           if (isObscure) {
                             isObscure = false;
                           } else {
                             isObscure = true;
                           }
                           setState(() {});
                         },
                       ),
                     ),
                     AppTextField(
                       fieldName: 'confirm password',
                       hintText: 'Enter your password',
                       controller: userNameController,
                       validator: (value){
                         if(value == null || value.trim().isEmpty){
                           return 'please enter your password';
                         }
                         if (value != passwordController.text) {
                           return "Password doesn't match";
                         }
                         return null;
                       },
                       keyboardType: TextInputType.visiblePassword,
                       isObscure:  isObscure,
                       suffixIcon: InkWell(
                         child:  isObscure
                             ? Icon(Icons.visibility_off)
                             : Icon(Icons.visibility),
                         onTap: () {
                           if (isObscure) {
                            isObscure = false;
                           } else {
                             isObscure = true;
                           }
                           setState(() {});
                         },
                       ),
                     ),
                   ],
                 )
             ),
            Padding(
              padding: EdgeInsets.all(40),
              child: ElevatedButton(
                onPressed: () {
                  // register();
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
                      'Sign up',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      'sign in',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple
                      ),
                    ),
                  )
                ],
              ),
            )


          ],
        ),
      ),

    );
  }
}