import 'dart:core';
import 'package:blind_side/providers/user_provider.dart';
import 'package:blind_side/view/widgets/pss_txt_field.dart';
import 'package:blind_side/view/widgets/txt_field.dart';
import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import '../../utils/routes.dart';
import '../widgets/resuable_btn.dart';





class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  //navigationService.navigateTo(SelectLocationScreenRoute);
                }),
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Consumer<AuthProvider>(
            builder: (context,i,_){
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
                        SizedBox(
                          height: sy(5),
                        ),
                        Container(
                          margin: EdgeInsets.all(
                            sy(10),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Log In",
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
                                  "Enter your emails and password",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: sy(12),
                                  ),
                                ),
                                SizedBox(
                                  height: sy(40),
                                ),
                                Form(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[


                                      txtField(
                                          cnt: i.emailCntLgn,
                                          title: "Email"
                                      ),

                                     PassTxtField(
                                         title: "Password",
                                         cnt: i.pssCntLgn
                                     )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        //navigationService.navigateTo(ResetPasswordScreenRoute);
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: sy(
                                            10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: sy(10),
                                ),


                                Btn(
                                  title: "Log In",
                                  onPressed: (){
                                    Provider.of<AuthProvider>(context,listen: false).handleSignInEmail();

                                  },


                                ),


                                SizedBox(height: 20,),
                                Container(
                                  height: 30,
                                  //color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: sy(10),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                         i. navigationService.navigateTo(SignUpScreenRoute);
                                        },
                                        child: Text(
                                          ' Sign up',
                                          style: TextStyle(
                                            color: Color.fromRGBO(47, 147, 255, 1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: sy(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                  if (i.isLoadingLogin)
                    Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                    ),
                ],
              );
            },
          )
        );
      },
    );
  }
}
