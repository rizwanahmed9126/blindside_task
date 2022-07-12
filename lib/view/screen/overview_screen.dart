import 'package:better_player/better_player.dart';
import 'package:blind_side/view/screen/comments_screen.dart';
import 'package:blind_side/view/widgets/related_videos_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/cmnts_plus_upload_provider.dart';
import '../../services/util_service.dart';
import '../../utils/service_locator.dart';
import '../widgets/expandable_txt.dart';
import '../widgets/video_player.dart';


// class OverviewScreen extends StatefulWidget {
//   final String videoUrl;
//   final String title;
//   final String desc;
//   final String name;
//   final String allowCmnts;
//
//   OverviewScreen({required this.name,
//     required this.videoUrl,required this.title,required this.desc,required this.allowCmnts});
//
//
//   @override
//   _OverviewScreenState createState() => _OverviewScreenState();
// }

class OverviewScreen extends StatelessWidget {

  final String videoUrl;
  final String title;
  final String desc;
  final String name;
  final String allowCmnts;

  OverviewScreen({required this.name,
    required this.videoUrl,required this.title,required this.desc,required this.allowCmnts});



  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final utilService=locator<UtilService>();


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,

        body:  Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 190,
                width: width,
                color: Colors.white,
                child:VideoPlayer()

              ),

              Expanded(

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          height: 40,
                          width: width,
                          //color: Colors.blue,
                          child: Text(
                            "$title",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          height: 50,
                          width: width,
                          //color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("5 minutes ago",style: TextStyle(color: Colors.grey[400]),),
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_outlined)),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt_outlined)),
                                  IconButton(onPressed: (){
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));

                                    if(allowCmnts=="false"){
                                      utilService.showToast("The comments for this chat is turn off");
                                     // print("the comments for this chat is turn off");
                                      return;
                                    }
                                    _showModelSheet(context);
                                  }, icon: Icon(Icons.comment)),
                                ],
                              )
                            ],
                          ),
                        ),
                        ExpandableText(
                          desc: "$desc"
                          //"Create a video serving platform that can take a user uploaded video and stream it back to the userVideo quality should be as best as possible based on the user’s connection speed.The video player should be aware of when the encoding is finished so that it may autoplay the video.If you choose to use AWS for any part of this, please use the free tier. We will not reimburse any incurred costs to your account.",
                        ),
                        Divider(
                          color: Colors.grey[300],
                        ),
                        Container(

                          //color: Colors.blue,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                child: CircleAvatar(
                                  backgroundImage:
                                  NetworkImage("https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 170,
                                //color: Colors.pink,
                                child: Text("$name"),
                              ),

                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],

                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child:
                                TextButton(
                                    onPressed: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add,size: 16,color: Colors.black,),
                                        SizedBox(width: 10,),
                                        Text("Follow",style: TextStyle(color: Colors.black),)
                                      ],
                                    )
                                ),                              ),

                            ],
                          ),
                        ),

                        Divider(
                          color: Colors.grey[300],
                        ),
                    Container(
                      height: 20,
                      child: Text("Related Videos",style: TextStyle(fontSize: 20),),
                    ),

                    Container(
                      height: 300,

                      child: StreamBuilder(
                          stream: _firestore.collection("videos").snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                            if(!snapshot.hasData){
                              return Column(
                                children: [
                                  SizedBox(height: height*0.2,),
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              );
                            }

                            return ListView(
                                children: snapshot.data!.docs.map((document)
                                {
                                  return RelatedVideos(context: context,
                                      thumbnailUrl: document["thumbnailUrl"],title: document["title"],
                                    desc: document["desc"],videoUrl: document["videoUrl"],allowCmnts: document["AllowCmnts"]

                                  );
                                }).toList()
                            );
                          }
                      ),

                    ),




                      ],
                    ),
                  ),
                ),
              )




            ],
          ),
        ),
    );
  }

  void _showModelSheet(BuildContext context) {
    showModalBottomSheet(
      // enableDrag: false,
      isScrollControlled: true,

      context: context,
      builder: (builder) {
        return Container(
          height: MediaQuery.of(context).size.height*0.6,
            child: CommentsScreen()
        );
      },
    );
  }





}






