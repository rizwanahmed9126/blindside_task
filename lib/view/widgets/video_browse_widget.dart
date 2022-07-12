import 'package:better_player/better_player.dart';
import 'package:blind_side/view/screen/overview_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class VideoBrowse extends StatelessWidget {
  final String videoUrl;
  final String thumbnail;
  final String title;
  final String desc;
  final String name;
  final String allowCmnts;
  const VideoBrowse({Key? key,required this.videoUrl,
    required this.title,required this.desc,
    required this.name,required this.thumbnail,required this.allowCmnts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>
                OverviewScreen(
              videoUrl: videoUrl,title: title,desc: desc,
                  name: name,allowCmnts: allowCmnts,)
        )
        );
      },
      child: Container(
        height: 230,
        width: width,
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
              height: 170,
              width: width,
              //color: Colors.red,
              child:CachedNetworkImage(
                imageUrl: '$thumbnail',
                placeholder: (context, url) => Image.asset("assets/images/placeholder.gif",fit: BoxFit.cover,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,

              )

             // Image.network("$videoUrl",fit: BoxFit.cover,),

            ),
            Expanded(
                child: Container(

                 // color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: CircleAvatar(
                          backgroundImage:
                          NetworkImage("https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 250,

                        //color: Colors.pink,
                        child: Text("$title"),
                      )
                      // Container(
                      //   height: 50,
                      //   width: 50,
                      //   decoration: BoxDecoration(
                      //     color: Colors.yellow,
                      //     shape: BoxShape.circle,
                      //     //borderRadius: BorderRadius.circular(22)
                      //   ),
                      //   child: Image.network("https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",fit: BoxFit.contain,),
                      // )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
