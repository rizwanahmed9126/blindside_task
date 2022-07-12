import 'package:blind_side/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';
import '../../services/navigation_service.dart';
import '../../utils/service_locator.dart';
import '../widgets/video_browse_widget.dart';

// class UploadedVideos extends StatefulWidget {
//   @override
//   _UploadedVideosState createState() => _UploadedVideosState();
// }

class UploadedVideos extends StatelessWidget {




  FirebaseFirestore _firestore=FirebaseFirestore.instance;




  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,

        body:ColumnScrollView(
          child:Column(
            children: [


              Container(
                height: height*0.8,
                color: Colors.white,

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
                            return VideoBrowse(
                              videoUrl: document["videoUrl"],
                              thumbnail: document["thumbnailUrl"],
                              title: document["title"],
                              desc: document["desc"],
                              name: document["userName"],
                              allowCmnts: document["AllowCmnts"],
                            );
                          }).toList()
                      );
                    }
                ),

              ),






            ],
          ),
        )

    );
  }
}