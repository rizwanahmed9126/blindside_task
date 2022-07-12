import 'package:better_player/better_player.dart';
import 'package:blind_side/providers/home_provider.dart';
import 'package:blind_side/utils/routes.dart';
import 'package:blind_side/view/widgets/resuable_btn.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {




  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(


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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                          Provider.of<HomeProvider>(context,listen: false).chooseFile();
                        },
                        child: Text(
                          "Upload Different",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,),
                        ),
                    )

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
      body: Consumer<HomeProvider>(
        builder: (context,i,_){
          return


            SafeArea(
            child: Container(
              height: height,
              width: width,
              //color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12,top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    GestureDetector(
                      onTap: () async{
                        i.result = await FilePicker.platform.pickFiles(allowMultiple: true,
                          type: FileType.video,
                          //allowedExtensions: [choosenFileType!],
                        );

                      },
                      child: Container(
                        width: width,
                        height: 150.h,
                        child: DottedBorder(
                            dashPattern: [3, 2],
                            radius: Radius.circular(100),
                            color: Color.fromRGBO(154, 183, 208, 1),
                            child: i.result!=null?  BetterPlayer.file(
                              i.result!.paths.first!,
                              betterPlayerConfiguration: BetterPlayerConfiguration(
                                autoPlay: true,

                              ),
                            ): Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/upload_icon.png"),
                                    width: 80.w,
                                    height: 80.h,
                                  ),
                                ),
                                Text(
                                  "Tap to Choose Videos to Upload",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(154, 183, 208, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),

                              ],
                            )
                        ),
                      ),
                    ),

                    Btn(
                        onPressed: ()async{
                          Navigator.pop(context);
                          i.navigationService.navigateTo(UploadScreenRoute2);


                        },
                        title: "Next"
                    )


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );


  }

}

