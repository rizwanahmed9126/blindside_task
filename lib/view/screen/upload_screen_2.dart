import 'package:blind_side/providers/cmnts_plus_upload_provider.dart';
import 'package:blind_side/providers/home_provider.dart';
import 'package:blind_side/view/widgets/resuable_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



class UploadScreen2 extends StatelessWidget {







  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return AbsorbPointer(
      absorbing: Provider.of<UploadProvider>(context,listen: false).isLoadingProgress,
      child: Scaffold(


        backgroundColor: Color.fromRGBO(244, 247, 254, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          bottom: PreferredSize(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          //navigationService.navigateTo(HomeScreenTeacherRoute);
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 30.h,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),

                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 50.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 62, 146, 1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(235, 210, 58, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                )),
                            width: 50.w,
                            height: 5.h,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(33, 109, 246, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                )),
                            width: 50.w,
                            height: 5.h,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(52, 239, 70, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                )),
                            width: 50.w,
                            height: 5.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(20.h),
          ),
        ),
        body: Consumer<UploadProvider>(
          builder: (context,i,_){
            return Stack(
              children: [
                SafeArea(
                  child: Container(
                    height: height,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            children: [
                              Container(
                                width: 400.w,
                                //height: 40.h,
                                child: TextField(
                                  controller: i.titleCnt,
                                  focusNode: i.focusNode,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 14.h, horizontal: 15.w),
                                    hintText: "Title",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                    ),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(154, 183, 208, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(154, 183, 208, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),


                              Container(
                                width: width,
                                height: height*0.25,
                                child: TextField(
                                  controller: i.descCnt,
                                  scrollPadding: EdgeInsets.all(20.0),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 99999,
                                  decoration: InputDecoration(
                                    //contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.w),
                                    hintText: "Write your issue....",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                    ),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(154, 183, 208, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(154, 183, 208, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Allow Comments",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                    ),

                                  ),
                                  CupertinoSwitch(

                                    trackColor: Colors.red, // **INACTIVE STATE COLOR**
                                    activeColor: Colors.green, // **ACTIVE STATE COLOR**
                                    value: i.allowCmnts,
                                    onChanged: (bool value) {
                                      i.setAllowCmnts(value);
                                      //setState(() { _switchValue = value; });
                                    },
                                  )
                                ],
                              )

                            ],
                          ),
                          Btn(
                              onPressed: ()async{
                                print("heelo");
                                i.showLoader(true);

                                final abc=Provider.of<HomeProvider>(context,listen: false).result;
                                Provider.of<UploadProvider>(context,listen: false).uploadVideo(context, abc).then((value){
                                  print(value);
                                  i.showLoader(false);

                                });



                              },
                              title: "Upload"
                          )


                        ],
                      ),
                    ),
                  ),
                ),


                if (i.isLoadingProgress)
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(color: Colors.blue,),
                      )
                  ),
              ],
            );
          },
        ),
      ),
    );


  }

}

