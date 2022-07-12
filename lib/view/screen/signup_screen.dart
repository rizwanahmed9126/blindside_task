
import 'package:blind_side/providers/user_provider.dart';
import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../services/navigation_service.dart';
import '../../utils/routes.dart';
import '../../utils/service_locator.dart';
import '../widgets/pss_txt_field.dart';
import '../widgets/resuable_btn.dart';
import '../widgets/txt_field.dart';



class SignUpScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AuthProvider>(context,listen: false);

    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: sy(18),
                  color: Colors.black,
                ),
                onPressed: () {
                  provider.navigationService.navigateTo(LoginScreenRoute);
                }),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,

          ),

          extendBodyBehindAppBar: false,


          body: Consumer<AuthProvider>(
              builder: (context,i,_) {
                return Stack(
                  children: [
                    ColumnScrollView(
                        child: Column(
                          children: [

                            Center(
                              child: Image.asset(
                                'assets/images/logo.png',
                                //scale: 7,
                              ),
                            ),
                            // SizedBox(
                            //   height: sy(10),
                            // ),
                            Container(
                              margin: EdgeInsets.all(
                                sy(15),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sign Up",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: sy(16),
                                      ),
                                    ),
                                    SizedBox(
                                      height: sy(4),
                                    ),
                                    Text(
                                      "Enter your credentials to continue",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: sy(12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: sy(30),
                                    ),
                                    Form(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                          txtField(
                                            cnt: i.fullNameController,
                                            title: "Full Name",
                                          ),


                                          txtField(
                                            cnt: i.emailController,
                                            title: "Email",
                                          ),
                                          PassTxtField(
                                            cnt: i.passController,
                                            title: "Password",
                                          )


                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: sy(10),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'By Continuing you agree to our \ ',
                                        style: TextStyle(
                                            fontSize: sy(10),
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey.shade700),
                                        children: const <TextSpan>[
                                          TextSpan(
                                              text: 'Terms of Service',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue)),
                                          TextSpan(
                                            text: ' and ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: sy(20),
                                    ),
                                    Btn(
                                      title: "Sign Up",
                                      onPressed: (){
                                        provider.handleSignUp();
                                      },
                                    ),



                                    SizedBox(
                                      height: sy(7),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Already have an account?",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: sy(10),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            provider.navigationService.navigateTo(LoginScreenRoute);
                                          },
                                          child: Text(
                                            ' Log In',
                                            style: TextStyle(
                                              color: Color.fromRGBO(47, 147, 255, 1),
                                              fontWeight: FontWeight.w600,
                                              fontSize: sy(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            )
                          ],
                        ),

                    ),
                    if (i.isLoadingSignUp)
                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          )
                      ),
                  ],
                );

              })


        );
      },
    );
  }
}
