import 'package:blind_side/providers/user_provider.dart';
import 'package:blind_side/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../services/navigation_service.dart';
import '../../services/storage_service.dart';
import '../../utils/service_locator.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var navigationService = locator<NavigationService>();
  var storageService = locator<StorageService>();







  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(112, 75, 57, 1),

      body: Stack(
        children: [

          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [

                  SizedBox(
                    height: 40.h,
                  ),
                  Stack(
                    children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 55.h,
                            backgroundImage: NetworkImage("https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",),

                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                    Text(
                        Provider.of<AuthProvider>(context,listen: false).userData!=null?
                        "${Provider.of<AuthProvider>(context,listen: false).userData!.name}":"Rizwan Ahmed",

                    style: TextStyle(
                      color: Color.fromRGBO(
                        253,
                        255,
                        254,
                        1,
                      ),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 22.h,
                        color: Color.fromRGBO(
                          239,
                          248,
                          247,
                          1,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                         "Germany",
                        style: TextStyle(
                          color: Color.fromRGBO(
                            239,
                            248,
                            247,
                            1,
                          ),
                          fontSize: 14.sp,
                          height: 1.5.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    top: 15.h,
                    right: 15.w,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            height: 40,
                            width: width,
                            //color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Icon(Icons.email,color: Color.fromRGBO(112, 75, 57, 1),),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Color.fromRGBO(
                                          116,
                                          131,
                                          146,
                                          1,
                                        ),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      Provider.of<AuthProvider>(context,listen: false).userData!=null?
                                      "${Provider.of<AuthProvider>(context,listen: false).userData!.email}":"rjunejo96@gmail.com",


                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: Color.fromRGBO(
                                          181,
                                          188,
                                          196,
                                          1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.h,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Icon(Icons.phone,color: Color.fromRGBO(112, 75, 57, 1),),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Text(
                                      "Phone",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Color.fromRGBO(
                                          116,
                                          131,
                                          146,
                                          1,
                                        ),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "+4915258644627",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: Color.fromRGBO(
                                          181,
                                          188,
                                          196,
                                          1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.h,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: ()async{
                                FirebaseAuth.instance.signOut();
                                await storageService.clearData();
                                navigationService.navigateTo(LoginScreenRoute);

                              },
                              child: Text("Logout")
                          )



                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
