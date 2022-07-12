import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screen/overview_screen.dart';

Widget RelatedVideos({context, required String thumbnailUrl, required String title,required String desc,required String videoUrl,required String allowCmnts}){
  return InkWell(
    onTap: (){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>OverviewScreen(
            videoUrl: videoUrl,title: title,desc: desc,name: title,allowCmnts: allowCmnts,)
      )
      );
    },
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 150,
              color: Colors.red,
              child: CachedNetworkImage(
                imageUrl: '$thumbnailUrl',
                placeholder: (context, url) => Image.asset("assets/images/placeholder.gif",fit: BoxFit.cover,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,

              )
              //Image.network("$thumbnailUrl",fit: BoxFit.cover,),
            ),
            SizedBox(width: 5,),
            Container(
              height: 90,
              width: 150,
              child: Text("${title}",style: TextStyle(fontSize: 18),maxLines: 3,overflow: TextOverflow.ellipsis,),
            ),
            Icon(Icons.more_vert)

          ],
        ),
        Divider(
          color: Colors.grey[300],
        ),

      ],
    ),
  );
}