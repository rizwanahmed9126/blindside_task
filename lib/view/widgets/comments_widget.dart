import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../providers/cmnts_plus_upload_provider.dart';
class MyMessageChatTile extends StatelessWidget {
  final double minValue = 8.0;
  final Message? message;
  final bool isCurrentUser;

  MyMessageChatTile({this.message, required this.isCurrentUser});
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Padding(
        padding: EdgeInsets.only(top: 38.0),
        child: Column(
          children: <Widget>[
            isCurrentUser
                ? Container(
              margin: EdgeInsets.only(left: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 22),
                    child: CircleAvatar(
                      backgroundImage:
                      AssetImage("assets/images/logo.png"),
                    ),
                  ),
                  Container(
                    width: 250.w,
                    padding: EdgeInsets.only(
                      top: sy(5),
                      bottom: sy(5),
                    ),
                    child: Bubble(
                      style: BubbleStyle(
                        radius: Radius.circular(10),
                        padding: BubbleEdges.all(
                          sy(17),
                        ),
                      ),
                      // radius: Radius.elliptical(40, 40),
                      margin: BubbleEdges.only(
                        right: sx(15),
                        left: sx(15),
                      ),

                      // nip: isCurrentUser ? BubbleNip.rightTop : BubbleNip.leftBottom,
                      color: Colors.grey.shade300,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SelectableText(
                              "${message!.messageBody}\n 2 minutes ago",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            )
                : Container(
              margin: EdgeInsets.only(left: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250.w,
                    padding: EdgeInsets.only(
                      top: sy(5),
                      bottom: sy(5),
                    ),
                    child: Bubble(
                      style: BubbleStyle(
                        radius: Radius.circular(10),
                        padding: BubbleEdges.all(
                          sy(18),
                        ),
                      ),
                      // radius: Radius.elliptical(40, 40),
                      margin: BubbleEdges.only(
                        right: sx(15),
                        left: sx(15),
                      ),
                      // nip: isCurrentUser ? BubbleNip.rightTop : BubbleNip.leftBottom,
                      color: Colors.blue.shade900,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SelectableText(
                              "${message!.messageBody}\n 5 minutes ago",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 22),
                    child: CircleAvatar(
                      backgroundImage:
                      AssetImage("assets/images/logo.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}